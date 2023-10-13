%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Position and shapes %%%

moveDynamicA = 
  \tweak X-offset -2
  \tweak Y-offset -6
  \etc
moveDynamicB = \tweak extra-offset #'(-1.5 . -2) \etc
moveDynamicC = \tweak extra-offset #'(-0.5 . -1.5) \etc
moveDynamicD = 
  \tweak X-offset -4
  \tweak Y-offset -8
  \etc
  
slurShapeA = \shape #'((0 . 0) (0 . 0) (0 . -2) (0 . 3)) \etc
tieShapeA = \shape #'((0 . 0) (0 . -0.25) (0 . -0.25) (0 . 0)) \etc
tieShapeB = \shape #'((0 . 0) (0 . 0.25) (0 . 0.25) (0 . 0)) \etc

%% Music %%%

global = {
  \time 6/8
  \key cs \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \oneVoice r8^\pp 
    \voiceOne <cs'' gs'>(_\rubato <gs e'> <cs fss> <fss, ds'>) r |
  r8^\pp <gs e'>( <e cs'> as gs as) |
  \oneVoice r8 <ds, b'>( <b gs'>) r <cs a'>( <a e'>) |
  r8 <bs gs'>^( <a cs> <cs gs'> bs bs' |
  <cs, fs cs'>)\noBeam \voiceOne <fs' cs'>( <cs a'> <fs bs> <bs, gs'>) r |
  r8 <cs a'>( <a fs'> ds cs ds) |
  \oneVoice r8 <gs, e'>( <e cs'>) r <fs d'>( <d a'>) |
  r8 <e cs'>^( <ds fs> <fs cs'>^\rit <e gs> e')\fermata |
  
  \barNumberCheck 9
  r8 <b gs'>-.(_\conAnima <gs ds'>-. <gs e'>^. <e cs'>^. <e b'>^.) |
  r8 \voiceOne <a, ds fs>-.(^\pocoRit <a ds fss>-.) <gs gs'>4. |
  \oneVoice r8 <b' gs'>-.( <gs ds'>-. <gs e'>^. <e cs'>^. <e b'>^.) |
  r8 <a, ds fs> <a ds fss> <gs d' fs gs>4. |
  r8 \voiceOne gs''-> e-> fss-> ds-> r |
  r8 <gs, e'> <e cs'> as gs cs, |
  \oneVoice r8 \voiceOne cs'-> a-> \oneVoice r \voiceOne bs-> gs-> |
  \oneVoice r8 \voiceOne <cs, a'> <a fs'> ds cs cs |
  
  \barNumberCheck 17
  cs4.-\moveDynamicC ^\sff cs~^\rit |
  cs4. cs~\fermata |
  cs2.-\tieShapeA~ |
  cs4.\fermata \oneVoice r4 r8 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo s4. s4 ds'8->\mf |
  e4.-> e |
  s2. |
  s4. s8 ds4 |
  s4. s4 gs8->\mf |
  a4.-> a |
  s2. * 2 |
  
  \barNumberCheck 9
  s2. |
  s4. ds,4 e8 |
  s2. * 2 |
  s8 <gs cs>4 <fss cs'> ds8-> |
  e4.-> e |
  s8 <cs fs>4 s8 <bs fs'>4 |
  s4. a |
  
  \barNumberCheck 17
  <fs a>8-\moveDynamicA \p r r <e a e'> r r |
  s4. <a fs'>8 r r |
  s2. * 2 |
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \voiceThree
  s2. |
  s4. cs' |
  s2. |
  s8 ds,( e gs ds gs |
  a8) s4 s4. |
  s4. fs' |
  s2. |
  s8 gs,( a cs gs) s |
  
  \barNumberCheck 9
  s2. * 5 |
  s4. cs |
  s2. |
  s4. fs, |
  
  \barNumberCheck 17
  cs4.-\moveDynamicB ^\sff cs~ |
  cs4. cs~\fermata |
  cs2.-\tieShapeB~ |
  cs4.\fermata \oneVoice r4 r8 |
}

leftHandLower = \relative {
  cs,8 <a'' gs'>( <e cs'> <a fss'> <ds, cs'>) r |
  \voiceFour cs,8^( <e' cs'> <gs gs'> fss gs as,) |
  ds,8 <b' gs'>^( <ds ds'>) ds, <cs' fss>^( <e cs'>) |
  \oneVoice <gs,, gs'>8 \voiceFour gs'4~ gs4. |
  fs8\noBeam \oneVoice \clef treble <d'' cs'>( <a fs'> <d bs'> <gs, fs'>) r |
  \clef bass fs,8 \clef treble <a' fs'>_( <cs cs'> \clef bass bs cs ds,) |
  \oneVoice gs,8 <e' cs'>( <gs gs'>) gs, <fs'bs>( <a fs'>) |
  \oneVoice <cs,, cs'>8\noBeam \voiceFour cs'4~ cs \oneVoice r8 |
  
  \barNumberCheck 9
  <e, e'>8-.( <b' b'>-. <gs' ds'>-. <e cs'>-. <gs gs'>-. <b gs'>-.) |
  <b,, b'>8 <b' b'>-.( q-.) q4. |
  <e, e'>8-.( <b' b'>-. <gs' ds'>-. <e cs'>-. <gs gs'>-. <b gs'>-.) |
  <b,, b'> <b' b'> q q <bs bs'> <gs gs'> |
  <cs,, cs'>8 <a''' cs a'> <e e'> <a cs a'> 
    <ds, \single \hide Accidental ds'> r |
  <cs,, cs'>8 <e'' cs'> <gs gs'> \voiceFour fss gs \oneVoice r  
  <cs,,, cs'>8 <d'' fs d'> <a a'> <cs,, cs'> <d'' fs d'> <gs, gs'> |
  <cs,, cs'>8^\sf <a'' fs'> <cs cs'> \voiceFour bs cs cs |
    
  \barNumberCheck 17
  fs,8\p r r e r r |
  s4. ds8 r r |
  cs,8-\slurShapeA(-\moveDynamicD\pp\sd cs' gs' e' \staffUp gs cs |
  gs'4.) s4. |
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
  s2. * 2 |
  s4 s8\< s4 s8\! |
  s4.\> s4 s8\! |
  s8 s4\pp s4. |
  s8 s4\pp s4. |
  s4. s4\< s8\! |
  s4.\> s4 s8\! |
  
  \barNumberCheck 9
  s2.\pp |
  s4.\< s4\> s8\! |
  s2. |
  s4.\< s4.\f |
  s2.\fff |
  s2. * 2 |
  s4. s8 s\sff s\sff |
  
  \barNumberCheck 17
}

tempi = {
  \textMark \markup \tempo-markup Andantino #2 #0 66
  \set Score.tempoHideNote = ##t
  \tempo 4 = 54
  s2. * 7 |
  s4. \tempo 4 = 48 s |
  
  \barNumberCheck 9
  \tempo 4 = 54
  s2. |
  s8 \tempo 4 = 52 s4 s4.|
  \tempo 4 = 54
  s2. * 6 |
  
  \barNumberCheck 17
  s4. \tempo 4 = 48 s |
  s4. \tempo 4 = 42 s |
}

% MIDI only
pedal = {
  s4.\sd s4\su\sd s8\su |
  s4.\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s4.\su\sd s4\su\sd s8\su |
  s4.\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s2\su\sd s8 s\su |
  
  \barNumberCheck 9
  s2.\sd |
  s4.\su\sd s\su\sd |
  s2.\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s4\su\sd s8\su |
  s4.\sd s4\su\sd s8\su |
  s4.\sd s\su\sd |
  s2\su\sd s4\su\sd |
  
  \barNumberCheck 17
  s2.\su |
}

forceBreaks = {
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
  s2. * 3 s2. \break
}

preludeTenNotes =
\score {
  \header {
    title = "10."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 10"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeTenMidi =
\book {
  \bookOutputName "prelude-op11-no10"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \tempi \pedal >>
    >>
    \midi {
      \context {
        \Staff
        \remove "Dynamic_performer"
      }
      \context {
        \Voice
        \consists "Dynamic_performer"
      } 
    }
  }
}
