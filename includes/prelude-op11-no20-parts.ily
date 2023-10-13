%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

tieShapesA = \override TieColumn.tie-configuration = #'((13 . 1) (2.5 . -1))
tieShapesOff = \revert TieColumn.tie-configuration

slurShapeA = \shape #'((0.5 . 0.5) (0.5 . 0.25) (0 . 0.25) (0 . 0)) \etc

forceHShiftA = \tweak NoteColumn.force-hshift 1.75 \etc
forceHShiftB = \tweak NoteColumn.force-hshift 1.5 \etc
forceHShiftC = \tweak NoteColumn.force-hshift 0.25 \etc
forceHShiftD = \tweak NoteColumn.force-hshift 1.3 \etc

moveRestA = \tweak Rest.Y-offset 0 \etc
moveRestB = \tweak Rest.Y-offset 0 \etc

%%% Music %%%

global = {
  \time 3/4
  \key c \minor
  \accidentalStyle piano
}

rightHandUpper = \relative { 
  \partial 4 \tuplet 3/2 { <ef'' ef'>4 <d d'>8 }
  \tieShapesA
  <f_~ f'^~>4 \tuplet 3/2 { q8 <ef ef'> <d d'> <c c'> <af af'> <f f'> } |
  \tieShapesOff
  <ef ef'>4 <d d'> <ef ef'>8 <f f'> |
  <g g'>4 <a a'>8[ <bf bf'>] <c c'> <ef ef'> |
  <g g'>4 <fs fs'> <ef ef'>8 <d d'> |
  \tieShapesA
  <f f'>4~ \tuplet 3/2 { q8 <ef ef'> <d d'>  <c c'> <af af'> <f f'> } |
  \tieShapesOff
  <ef ef'>4 <d d'> <df df'>8 <d d'> |
  <ef ef'>4 <f f'>8[ <g g'>] <af af'> <bf bf'> |
  <b b'>8 <c c'> r4 \tuplet 3/2 { <c c'>4 \ottava 1 <c' c'>8 } |
  
  \barNumberCheck 9
  <c c'>4~ \tuplet 3/2 { q8 <bf bf'> <af af'> } 
    <g g'>16[ <f f'> <c c'> \ottava 0 \moveRestA r32 <af af'>] |
  <af c af'>4 <c ef> \tuplet 3/2 { <c, c'> <c' c'>8 } |
  q4~ \tuplet 3/2 { q8 <bf bf'> <af af'> } 
    <g g'>16[ <f f'> <c c'> \moveRestB r32 <af af'>] |
  <af c af'>4 <c ef> r |
  \tuplet 3/2 { \voiceOne r8 g' af } c4 \oneVoice r |
  \tuplet 3/2 { \voiceOne r8 af a } <ef a ef'>4 
    \tuplet 3/2 { <d d'>4 <c c'>8 } |
  \oneVoice <c ef c'>2 <g c g'>4 |
  <g g'>~ \tuplet 3/2 { q4 <f f'>8 <af af'>4 <g g'>8 } |
  
  \barNumberCheck 17
  <df' df'>4~ \tuplet 3/2 { q8 <c c'> <bf bf'>  <af af'> <f f'> <df df'> } |
  \clef bass <c f c'>2 <b f' b>4 |
  <c f c'>4 <c af' d>^\rit \tuplet 3/2 { r8 r \clef treble <c' c'> } |
  \voiceOne c'2 af4 |
  s2. * 2 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceOne
  \partial 4 s4
  c'''2 \tuplet 3/2 { f,4 c8 } |
  \voiceTwo b2 \voiceOne b4 |
  b4 g' g |
  c4 c a |
  c2 \tuplet 3/2 { f,4 c8 } |
  \voiceTwo cf2 \forceHShiftA cf4 |
  \forceHShiftA df4 \voiceOne df df8 g |
  g4 s2 |
  
  \barNumberCheck 9
  f'2 c4 |
  s2. |
  f,2 \voiceTwo c4 |
  s2. |
  <c, ef>4~ q s4 |
  q4 s a' |
  s2. |
  c,2 b4 |
  
  \barNumberCheck 17
  \forceHShiftB e4-\slurShapeA ( f) \tuplet 3/2 { df4 \forceHShiftD f,8 } |
  s2. * 2 |
  <c' f>2. |
  <c ef>2.~ |
  q2. |
}

rightHand = {
  \global
  \omit Staff.TupletNumber
  \omit Staff.TupletBracket
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \voiceThree 
  \partial 4 s4
  s2. |
  \tuplet 3/2 { s8 \forceHShiftC b4 s8 \forceHShiftC b4 } s4 |
  s2. * 3 |
  \tuplet 3/2 { s8 cf4 s8 cf4 } s4 |
  s2. |
  \tuplet 3/2 { s8 \voiceFour g4 } s2 |
  
  \barNumberCheck 9
  s2. |
  \tuplet 3/2 { s8 \voiceThree af4 s8 ef'4  } s4 |
  s2. |
  \tuplet 3/2 { s8 d, ef  s \voiceThree ef4 } s4 |
  s2. * 4 |
  
  \barNumberCheck 17
  s2. * 3 |
  \showStaffSwitch
  ef'2 d4 |
  \staffUp c'2.~ |
  c2. |
}

leftHandLower = \relative {
  \partial 4 r4
  \tuplet 3/2 { <af, af'>8 c' f, } c''4 r |
  \tuplet 3/2 {
    <af,, af'>8 <gf' gf'> <f f'> r <gf gf'> <f f'> r <f b f'> <af, af'> |
    r8 <d b'd> <g, g'> r <d' g d'> <f, f'>  <ef ef'> <d d'> <c c'> |
    <ef' c' ef>8 <af,, af'> <a a'>  <fs'' c' fs> <d, d'> <a' a'>
      <c' fs c'> <fs, c' fs> <c fs c'> |
    <af, af'> < f'' c' f> <c f c'> 
  } <c' f c'>4 r |
  \tuplet 3/2 {
    <af, af'>8 <gf' gf'> <f f'> r <gf gf'> <f f'> r <f cf' f> <af, af'> |
    r8 <ef' bf' ef> <g, g'>  <ef' bf' ef> <f, f'> <ef ef'>
      <ef' bf' ef> <bf, bf'> <ef, ef'> |
    <e e'> <df'' df'> <c c'>  <bf' g' bf> <c, c'> <c' c'>
      <c bf' c> <c, c'> r |
      
    \barNumberCheck 9
    <f,, f'> <af'' af'> <c, c'> <af' d f c'>4 \clef treble <c c'>8
  } <af' c af'>8.. \clef bass <gf,,, gf'>32\noBeam |
  \tuplet 3/2 {
    <ef' ef'>8 <d' d'> <ef ef'>  r <bf' bf'> <af af'>
      <ef af ef'> <af, af'> <gf, gf'> |
    <f f'>8 <af' af'> <c, c'> <d' af' c>4 <c c'>8
  } <af' c af'>4 |
  \tuplet 3/2 { 
    <gf,, gf'>8 <af' af'>4  r8 <bf bf'> <af af'>  <g g'>4 <fs fs'>8 |
  }
  <af af'>4~ \tuplet 3/2 { q8 <g g'> <f f'>  <ef ef'> <c c'> <af af'> } |
  <g g'>4 <fs fs'> <ef'' a ef'> |
  \tuplet 3/2 { 
    r8 r <g,, g'> <c c'> <d d'> <ef ef'> <bf' bf'>4 q8 |
    q8 <af af'> <d, d'>
  } <af' af'>4 <g g'> |
  
  \barNumberCheck 17
  \tuplet 3/2 { q4 c,8 } <af' af'>4 c, |
  \tuplet 3/2 { 
    r8 r <c, c'>\p <f f'>\< <g g'> <af af'> <ef' ef'>4\sf <df df'>8\> |
    <c c'>-- <af af'>-- <g g'>--\!
  } <f f'>4 \tuplet 3/2 { r8 r c''->~ } |
  <c af'>2. |
  \ottava -1 c,,8 \ottava 0 c' c' g' ef' g, |
  \clef treble c'2. |
}

leftHand = {
  \global
  \omit Staff.TupletNumber
  \omit Staff.TupletBracket
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 4 \tuplet 3/2 { s4\< s8\! }
  s2.\f |
  s2. |
  s2.\cresc |
  s4\> s\! \tuplet 3/2 { s4\< s8\! } |
  s2.\sf |
  s4\> s2\! |
  s2.\cresc |
  s2 s4\cresc |
  
  \barNumberCheck 9
  s2.\ff |
  s2. * 2 |
  s2 s4\f |
  s2. |
  s2 s4\dim |
  s2.\mf |
  s2. |
  
  \barNumberCheck 17
  s2.\p |
  s2.^\sottoVoce |
  s2. * 2 |
  s2.-\tweak X-offset 0 \pp |
  s2. |
}

% MIDI only 
pedal = {
  \partial 4 s4 
  s2\sd s4\su |
  s4\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su |
  s4\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 9
  s2\su\sd s8. s32\su s\sd |
  s4\sd s\su\sd s\su\sd |
  s2\su\sd s8. s32\su s\sd |
  s4\sd s\su\sd s\su\sd |
  s2.\su |
  s4 s2\sd |
  s2.\su |
  s2. |
  
  \barNumberCheck 17
  s2. * 4 |
  s2.\sd |
  s2. |
}

tempi = {
  \textMark \markup \tempo-markup Appassionato #2 #0 116
  \set Score.tempoHideNote = ##t
  \tempo 4 = 100
  \partial 4 s4
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 4 |
  \tempo 4 = 92
  s2. * 4 |
  
  \barNumberCheck 17
  s2. * 2 |
  s2 \tempo 4 = 84 s4 |
  s2. * 2 |
}

forceBreaks = {
  \partial 4 s4
  s2.\noBreak s2.\noBreak s2.\noBreak s2.\break\noPageBreak
  s2.\noBreak s2.\noBreak s2.\noBreak s2.\break\noPageBreak
  s2.\noBreak s2.\noBreak s2.\noBreak s2.\break\noPageBreak
  s2.\noBreak s2.\noBreak s2.\noBreak s2.\break\noPageBreak
}

preludeTwentyNotes =
\score {
  \header {
    title = "20."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 20"
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

preludeTwentyMidi =
\book {
  \bookOutputName "prelude-op11-no20"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
