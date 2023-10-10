%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

tieShapeA = \shape #'((0 . 0) (0 . 0.5) (0 . 0.5) (0 . 0)) \etc
tieShapeB = \shape #'((0.5 . 0.5) (0 . 1) (0 . 1) (0 . 0.5)) \etc
tieShapeC = \shape #'((0 . 0.5) (0 . 0.25) (0 . 0.25) (0 . 0.5)) \etc
tieShapeD = \shape #'((0 . 0.25) (0 . 0) (0 . 0) (0 . 0.25)) \etc
tieShapeE = \shape #'((0 . 0.25) (0 . 0) (0 . 0) (0 . 0.25)) \etc
tieShapeF = \shape #'((0 . 0.25) (0 . 0) (0 . 0) (0 . 0.25)) \etc
tieShapeG = \shape #'((0.5 . 0.75) (0 . 0.5) (0 . 0.5) (-.5 . 0.5)) \etc
tieShapeH = \shape #'((0 . -0.25) (0 . 0) (0 . 0) (0 . 0)) \etc

%%% Music %%%

global = {
  \time 2/4
  \key b \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup Allegro #2 #0 168-172
  r4 <cs cs'>->~ |
  q8 <b b'> <e e'>4->~ |
  q8 <d d'> <g g'>4->~ |
  q8 <fs fs'> <d' d'>4->~ |
  q8 <e e'> <cs cs'>4~ |
  q8 <d d'> <b b'>4~ |
  q8 <d d'> <cs cs'> <b b'> |
  <as as'>2 |
  
  \barNumberCheck 9
  r4 <fs fs'>->~ |
  q8 <e e'> <a a'>4->~ |
  q8 <g g'> <c c'>4->~ |
  q8 <b b'> <g' g'>4->~ |
  q8 <a a'> <fs fs'>4~ |
  q8 <g g'> <e e'>4~ |
  \voiceOne 
  q8 <g g'> <es es'> <fs fs'> |
  \oneVoice 
  <g g'>2 |
  
  \barNumberCheck 17
  r4 \clef bass <a,, a'>4~ |
  q8 <g g'> <ef' fs c' ef>4 |
  r8 \clef treble fs~ <fs c' fs>4 |
  r8 <f g>~ <f g d' g>4 |
  r4 <d d'>4~ |
  q8 <c c'> <af' b f' af>4 |
  r8 b~ <b f' b>4 |
  r8 c~ <c e c'>4 |
  
  \barNumberCheck 25
  r8 cs~ <cs e as>4 |
  r8 b~ <b ds b'>4 |
  r8 b~ <b ds b'>4 |
  r8 b~ <b ds b'>4 |
  r8 b~ <b ds b'>4 |
  r8 b~ <b e b'>4 |
  r8 b8~ <b es b'>4 |
  r8 b8~ <b es b'>4 |
  
  \barNumberCheck 33
  r8 d~ <d fs b d>4 |
  r8 cs~ <cs fs as cs>4 |
  r4 <cs, cs'>~ |
  q8 <b b'> <e e'>4~ |
  q8 <d d'> <g g'>4-\tieShapeH ~ |
  q8 <fs fs'> <d' d'>4~ |
  q8 <e e'> <cs cs'>4~ |
  q8 <d d'> <b b'>4~ |
  
  \barNumberCheck 41
  q8 <cs cs'> <as as'>4~ |
  q8 <b b'> <g g'>4~ |
  q8^\rit <a a'> <g g'>4~ |
  q8 q <fs fs'>4~ |
  q8 q <es es'>4~ |
  q8 q^\rit <e e'>4~ |
  q8 q <ds ds'>4-\tieShapeG ~ |
  q8 q^\rit <f f'>4 |
  
  \barNumberCheck 49
  <cs g' b cs>2~ |
  q2\fermata |
  \clef bass
  <cs fs b cs>2~ |
  q2 |
  <e fs as d>2~ 
  q2 |
  <d fs b fs'>2~^\ms |
  q2 ~ |
  q2 ~ |
  q2 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  s2 * 4 |
  b'2 |
  a2 |
  g4 cs, |
  cs2 |
  
  \barNumberCheck 9
  s2 * 4 |
  \voiceOne
  e'2 |
  d2 |
  \voiceTwo
  c2 |
  \voiceOne
  b2 |
  
  \barNumberCheck 17
  s2 * 8 |
  
  \barNumberCheck 25
  s2 * 8 |
  
  \barNumberCheck 33
  s2 * 2 |
  \voiceTwo
  s4 fs,4~ |
  fs4 b~ |
  b4 cs~ |
  cs4 fs |
  b2 |
  a2 |
  
  \barNumberCheck 41
  g2 | 
  fs2 |
  e4-\tieShapeA ~ e8 d |
  cs4-\tieShapeB ~ cs8 c |
  b4-\tieShapeC ~ b8 b |
  b4-\tieShapeD ~ b8 b |
  b4-\tieShapeE ~ b8 b |
  b4-\tieShapeF ~ b8 b|
  
  \barNumberCheck 49
}

rightHand = {
  \global
  << 
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \clef bass
  <b,, b'>4->~ q8 <as as'> |
  <d d'>4->~ q8 <cs cs'> |
  <fs fs'>4->~ q8 <e e'> |
  <as as'>4->~ q8 <b b'> |
  <g g'>4~ q8 <a a'> |
  <fs fs'>4~ q8 <g g'> |
  <e e'>4 <es es'> |
  <fs fs'>8 <es es'>-> <g g'>-> <fs fs'>->
  
  \barNumberCheck 9
  <e e'>4->~ q8 <ds ds'> |
  <g g'>4->~ q8 <fs fs'> |
  <b b'>4->~ q8 <a a'> |
  <ds ds'>4->~ q8 <e e'>8 |
  <c c'>4~ q8 <d d'>8 |
  <b b'>4~ q8 <c c'> |
  <a a'>4 <d, d'>~ |
  q8 <g g'>-> <a a'>-> <g g'>-> |
  
  \barNumberCheck 17
  <g, g'>4~ q8 <fs fs'> |
  <bf bf'>4~ q8 <a a'> |
  <ef' ef'>4~-\sfMarkup q8 <d d'> |
  <c c'>4~ q8 <b b'> |
  <c c'>4~ q8 <b b'> |
  <ef ef'>4~ q8 <d d'> |
  <af' af'>4~-\sfMarkup q8 <g g'> |
  <af af'>4~ q8 <g g'> |
  
  \barNumberCheck 25
  <g g'>4~ q8 <fs fs'> |
  <g g'>4~ q8 <fs fs'> |
  <g g'>4->~ q8 <fs fs'> |
  <ds ds'>4->~ q8 q |
  <b b'>4->~ q8 q |
  <g g'>4~ q8 q |
  <g g'>4~ q8 <cs' es b'> |
  q4. <fs,, fs'>8 |
  
  \barNumberCheck 33
  <d'' fs b>4 r8 <fs,, fs'> |
  <cs'' fs as>4 r8 <fs,, fs'>8 |
  <b b'>4~ q8 <as as'> |
  <d d'>4~ q8 <cs cs'> |
  <fs fs'>4~ q8 <e e'> |
  <as as'>4~ q8 <b b'> |
  <g, g'>4~ q8 <a' a'> |
  <fs, fs'>4~ q8 <g' g'> |
  
  \barNumberCheck 41
  <e, e'>4~ q8 <fs' fs'> |
  <d, d'>4~ q8 <e' e'> |
  <cs cs'>4 <b b'> |
  <as as'>4 <a a'> |
  <gs gs'>4 <g g'> |
  <cs, cs'>2 |
  <fs fs'>~ |
  q2 |

  \barNumberCheck 49
  <es es'>2~ |
  q2_\fermata |
  <fs fs'>2~ |
  q2 |
  q2~ |
  q2 |
  <b, b' fs'>~ |
  <b' fs'>2~ |
  q2~ |
  q2 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2\mf |
  s4 s\cresc |
  s2 * 2 |
  s8 s4.\dim |
  s2 |
  s4 s\mf |
  s2\f |
  
  \barNumberCheck 9
  s4 s\mf |
  s4 s\cresc |
  s2 * 2 |
  s4 s\dim |
  s2 * 2 |
  s2\f |
  
  \barNumberCheck 17
  s4\p s\< |
  s4.. s16\! |
  s2\f |
  s4.\> s8\! |
  s2\p |
  s8 s4\< s8\! |
  s4\f s8\> s\! |
  s2 |
  
  \barNumberCheck 25
  s2\cresc |
  s2 * 7 |
  
  \barNumberCheck 33
  s2 * 2 |
  s2\ff |
  s2 * 5 |
  
  \barNumberCheck 41
  s2 * 8 |
  
  \barNumberCheck 49
  s2 * 2
  s2\fff |
}

forceBreaks = {
  s2 * 5 s2\break
  s2 * 5 s2\break
  s2 * 5 s2\break
  s2 * 4 s2\break
  s2 * 4 s2\pageBreak
  
  s2 * 4 s2\break
  s2 * 4 s2\break
  s2 * 5 s2\break
  s2 * 5 s2\break
}

preludeSixNotes =
\score {
  \header {
    title = "6."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 6"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeSixMidi =
\book {
  \bookOutputName "prelude-op11-no06"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics >>
      \new Staff = "lower" << \leftHand \dynamics >>
    >>
    \midi {
      \tempo 4 = 168
    }
  }
}
