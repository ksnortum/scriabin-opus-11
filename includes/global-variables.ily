\version "2.24.0"

%
% Scheme functions
%

#(define ((time-alternate-time upa downa upb downb) grob)
   (grob-interpret-markup grob
     (markup #:override '(baseline-skip . 0) #:number
       (#:line (
           (#:center-column (upa downa))
           (#:center-column (upb downb)))))))

#(define-markup-command (tempo-markup layout props tempo dur dots mm) 
                        (markup? integer? integer? markup?)
  "\tempo emulator, but with no parens around MM"
  ; tempo = the text of the tempo, so Allegro, Lento, etc.
  ; dur   = log 2 of the duration, so 0 = whole, 1 = half, 2 = quarter, ..."
  ; dots  = the number of dots after the duration
  ; mm    = the metronome mark, so 100 or 63-76
  ; example: \textMark \markup \tempo-markup Vivace #2 #1 63-76 c'1
  (interpret-markup layout props
    (let ((dura (ly:make-duration dur dots)))
      #{\markup {
        \hspace #1.5 \bold #tempo
        % \teeny "M.M."
        \hspace #0.5 \raise #0.4 \tiny \note { #dura } #UP
        \small { "=" #mm }
      }#})))
%{
makeSpanner =
#(define-music-function (mrkup) (markup?)
  #{
    \override TextSpanner.Y-offset = -0.25
    \override TextSpanner.bound-details.left.text = #mrkup
    \override TextSpanner.bound-details.left.stencil-align-dir-y = 0.25
    \override TextSpanner.bound-details.left-broken.text = ##f
  #})

spacingSectionOn = 
#(define-music-function (dur) (real?)
   #{
     \newSpacingSection
     \override Score.SpacingSpanner.spacing-increment = #dur
   #})

spacingSectionOff = {
  \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
}

forceStemLength =
#(define-music-function (len) (number?)
   (once
    (propertyOverride
     '(Stem after-line-breaking)
     (lambda (grob)
       (let ((beam (ly:grob-object grob 'beam)))
         (ly:grob-property beam 'quantized-positions)
         (ly:grob-set-property! grob 'length len))))))
%}

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

lhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 1.5)(rlineto 0.5 0))
}
rhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 -1.5)(rlineto 0.5 0))
}

%{
ohn = \once \hideNotes 
ooa = \once \omit Accidental

tweakInsideSlur = 
  \tweak avoid-slur #'inside 
  \tweak outside-staff-priority ##f
  \etc

fingeringInsideStaffOn = \override Fingering.staff-padding = #'()
fingeringInsideStaffOff = \revert Fingering.staff-padding

slashFlag = \once \override Flag.stroke-style = "grace"
%}

insideSlur = \tweak avoid-slur #'inside \etc

textInsideSlur = \once {
  \override TextScript.avoid-slur = #'inside
  \override TextScript.outside-staff-priority = ##f
}

articulationInsideSlur = \override Script.avoid-slur = #'inside

ottavaInsideSlur = {
  \override Score.OttavaBracket.avoid-slur = #'inside
  \override Score.OttavaBracket.outside-staff-priority = ##f
}

voiceFive = #(context-spec-music (make-voice-props-set 4) 'Voice)
voiceSix = #(context-spec-music (make-voice-props-set 5) 'Voice)

hideNoteHead = {
  \once {
    \omit Stem
    \omit Dots
    \omit Flag
    \hideNotes
  }
}

%
% Markup
%

rubato = \markup \large \italic "rubato"
accel = \markup \large \italic "accel."
rit = \markup \large \italic "rit."
aTempo = \markup \large \italic "a tempo"
conAnima = \markup \large \italic "con anima"
sfMarkup = \markup \dynamic "sf"
ms = \markup \large \italic "m.s."
md = \markup \italic "m.d."
ppSotoVoce = \markup { \dynamic pp \large "soto voce" }
ppRubato = \markup { \dynamic pp \large "rubato" }
dimMarkup = \markup \large \italic "dim."
smorz = \markup \large \italic "smorz."
pocoRit = \markup \large \italic "poco rit."
crescConPassione = \markup \large \italic "cresc. con passione"
sottoVoce = \markup \large \italic "sotto voce"
dolciss = \markup \large \italic "dolciss."
