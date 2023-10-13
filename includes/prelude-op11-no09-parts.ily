%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Position and shapes %%%

moveHairpinA = \tweak X-offset 0.5 \etc
moveDynamicA = \tweak Y-offset -4 \etc

%% Music %%%

global = {
  \time 3/4
  \key e \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \oneVoice r4 \voiceOne e''(^\rubato b |
  a2.~ |
  a4) a( b |
  gs4 fs2) |
  \oneVoice r4 \voiceOne fs( gs |
  \oneVoice <e, cs' e>4 <cs' gs' e'>-> <e gs ds'> |
  <e gs cs>4 <e fs ds'> <e as cs> |
  <e a cs>4 <ds fs b>) r4 |
  
  \barNumberCheck 9
  r4 \voiceOne e'8(^\rit ds \tuplet 3/2 { cs b8. cs16 } |
  a2.~ |
  a4) a( b |
  gs fs) r4 |
  \oneVoice r4 fs2^( |
  r4 fs gs) |
  r4^\accel \voiceOne b2( |
  b4\rest b cs) |
  
  \barNumberCheck 17
  \oneVoice r4-\moveDynamicA \mf \voiceOne cs( a |
  b2.) |
  r4 cs( a |
  \oneVoice <cs, fs b>4 <cs fs a> <a cs  fs>) |
  r4 \voiceOne gs'( e^\rit |
  fs2.) |
  \oneVoice r4 \voiceOne gs( e |
  e2.) |
  
  \barNumberCheck 25
  \oneVoice r4 \voiceOne e2( |
  fs2.) |
  \oneVoice r4 \voiceOne fs2( |
  gs2.) |
  \oneVoice r4 \voiceOne gs2( |
  a2~ a8) \oneVoice b\rest\fermata |
  r4 \voiceOne e8( ds \tuplet 3/2 { cs b8. cs16 } |
  a2) \tuplet 3/2 { cs8( b8. cs16 } |
  a2.) |
  \oneVoice <b, ds gs>2. |
  <gs e' b'>2.~\arpeggio |
  q2. |
}

rightHandLower = \relative {
  \voiceTwo
  s4 <e' a> e |
  <cs e>4 q q |
  <c e> <b ds> <a e'> |
  <a ds> q <fs cs'> |
  s4 q <fs bs> |
  s2. * 3 |
  
  \barNumberCheck 9
  s4 <e' a> e |
  <cs e>4 q q |
  <c e>4 <b ds> <a e'> |
  <a ds> q <fs cs'> |
  s4 q q |
  s4 q <fs bs> |
  s4 <b fs'> q |
  s4 q <b es> |
  
  \barNumberCheck 17
  s4 <cs a'> q\< <>\! |
  <d a'>4-\moveHairpinA \> q\! q |
  s4 <cs a'> q |
  s2. |
  s4 <gs e'>4 q |
  <a e'>4 q q |
  s4 <gs e'> q |
  a4 a^\rit a\fermata |
  
  \barNumberCheck 25
  s4 <a c> q |
  <a e'>4 q q |
  s4 <gs bs e> q |
  <gs e'>4 q q |
  s4 <a cs e> q |
  <a e'>4 q q |
  s4 <e' a> e |
  <cs e>4 q e |
  <cs e>2. |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 8 |
  
  \barNumberCheck 17
  s4 \voiceThree fs'4. a,8 |
  fs'2 es4 |
  s4 fs2 | 
  s2. |
  s4 cs4. e,8 |
  cs'2 bs4 |
  s4 cs4. e,8 |
  cs'4. c |
  
  \barNumberCheck 25
  s4 e,4. e8_~ |
  << { \voiceFour e2. | } \new Voice { \voiceThree c'2. | } >>
  s4 \voiceThree e,4. e8_~ |
  << { \voiceFour e2. | } \new Voice { \voiceThree bs'2. | } >>
  s4 \voiceThree e,4. e8_~ |
  <<
    { 
      \voiceFour e2 r4 |
      s2. |
      s2. |
    }
    \new Voice {
      \voiceThree
      cs'2~( cs8~ cs~\noBeam\fermata |
      \oneVoice cs8 bs cs fs, gs cs, |
      fs2) <cs gs'>4 |
    }
  >> 
}

leftHandLower = \relative {
  cs'8-- bs cs-- fs,-- gs-- cs,-- |
  fs2.~ |
  fs8 es fs b, cs fs, |
  b2 a4 |
  gs8 a e' ds~ ds gs, |
  cs,8 gs' e' gs, e' b' |
  fs,8 cs' b' as gs fs |
  fs8 gs a-- as-- b-- bs-- |
  
  \barNumberCheck 9
  cs8 bs cs fs, gs cs, |
  fs2.~ |
  fs8 es fs b, cs fs, |
  b2-> a4 |
  gs8\< a e'\> ds~ ds4\! |
  gs,8\< a e'\> ds~ ds4\! |
  cs8\< d a'\> gs~ gs4\! |
  cs,8\< d a'\> gs~ gs4\! |
  
  \barNumberCheck 17
  \voiceThree gs8 a_~ \voiceFour a4. a8~ |
  a2. |
  \voiceThree gs8 a_~ \voiceFour a2 |
  d2. |
  \voiceThree ds,8 e_~ \voiceFour e4. e8~ |
  e2. |
  \voiceThree ds8 e_~ \voiceFour e4. e8 ~
  e2. |
  
  \barNumberCheck 25
  \oneVoice gs,8_( a~ \voiceFour a2 |
  \hideNoteHead e'2.) |
  \oneVoice fss,8_( gs~ \voiceFour gs2 |
  \hideNoteHead e'2.) |
  \oneVoice es,8_( fs~ \voiceFour fs2 |
  \hideNoteHead e'2) s4 |
  s2. |
  s2. |
  \oneVoice fs2. |
  b,2. |
  <e,, e' b'>~\arpeggio |
  <e' b'>2. |
  \bar "|."
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.-\tweak Y-offset 1 \mf |
  s4 s-\tweak Y-offset 1 \> s\! |
  s2-\tweak Y-offset 1 \p s8-\tweak Y-offset 1 \< s\! |
  s4\> s2\! |
  s2 s4-\tweak extra-offset #'(-1 . 0) \cresc |
  s2. |
  s4 s2-\tweak Y-offset 2 \> |
  s4 s2\! |
  
  \barNumberCheck 9
  s2.-\tweak X-offset 0 -\tweak Y-offset 2 \pp |
  s2-\tweak Y-offset 1 \< s4\! |
  s2.-\tweak Y-offset 1 \mf |
  s4\> s2\! |
  s2.-\tweak Y-offset 1 \p |
  s2 s4-\tweak extra-offset #'(-2 . 0) \cresc |
  s2. * 2 |
  
  \barNumberCheck 17
  s2.\! | % fm
  s2. * 2 | % < | >
  s2.\p |
  s2\p s8\< s\! |
  s8 s\> s s\! s4 |
  s2. * 2 |
  
  \barNumberCheck 25
  s2.-\tweak X-offset 0 \pp |
  s2 s4-\tweak extra-offset #'(-2.5 . 0) \cresc |
  s2. * 2 |
  s2-\tweak extra-offset #'(0 . -1) \cresc s8-\tweak Y-offset -1 \< s\! |
  s2. |
  s2.-\tweak Y-offset 1 \mf |
  s2 s4\pp |
}

% MIDI only
pedal = {
  s4 s8\sd s\su\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s8\su\sd s\su\sd s\su\sd s\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su s8\sd s\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2.\su |
  
  \barNumberCheck 9
  s4 s8\sd s\su\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s8\su\sd s\su\sd s\su\sd s\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2.\su |
  s2. * 3 |
  
  \barNumberCheck 17
  s4 s2\sd |
  s2\su\sd s4\su |
  s4 s2\sd |
  s2.\su\sd |
  s4\su s2\sd |
  s2\su\sd s4\su |
  s4 s2\sd |
  s4.\su\sd s\su\sd |
  
  \barNumberCheck 25
  s4\su s2\sd |
  s2. |
  s4\su s2\sd |
  s2. |
  s4\su s2\sd |
  s2 s8 s\su |
  s4 s8\sd s\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  
  \barNumberCheck 33
  s2.\su |
}

tempi = {
  \textMark \markup \tempo-markup Andantino #2 #0 66
  \set Score.tempoHideNote = ##t
  \tempo 4 = 66
  s2. * 8 |
  
  \barNumberCheck 9
  s4 \tempo 4 = 60 s2 |
  \tempo 4 = 66 
  s2. * 5 |
  \tempo 4 =  69
  s2. |
  \tempo 4 = 72
  s2. |
  
  \barNumberCheck 17
  \tempo 4 = 76
  s2. |
  \tempo 4 = 80
  s2. |
  \tempo 4 = 84
  s2. |
  \tempo 4 = 88
  s2. |
  s4 \tempo 4 = 80 s2 |
  \tempo 4 = 72
  s2. |
  \tempo 4 = 66
  s2. |
  \tempo 4 = 60
  s2 \tempo 4 = 40 s4 |
  
  \barNumberCheck 25
  \tempo 4 = 66 
  s2. * 5 |
  s2 s8 \tempo 4 = 40 s |
  \tempo 4 = 66
  s2. * 2 |
  
  \barNumberCheck 33
}

preludeNineNotes =
\score {
  \header {
    title = "9."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 9"
  }
  \keepWithTag layout  
  \new PianoStaff \with { connectArpeggios = ##t } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

preludeNineMidi =
\book {
  \bookOutputName "prelude-op11-no09"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
