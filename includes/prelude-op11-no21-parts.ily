%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((-1 . 3) (0 . -3) (0 . -0.5) (0 . 1)) \etc
slurShapeB = \shape #'((-1 . 3) (0 . -3) (0 . -0.5) (0 . 1)) \etc
slurShapeC = \shape #'((0 . -7) (0 . -2) (0 . 1) (0 . 0)) \etc
slurShapeD = \shape #'((0 . -3) (0 . 2) (0 . 0) (0 . 0)) \etc
slurShapeE = \shape #'((0 . -2.5) (0 . 2) (0 . 0) (0 . 0)) \etc
slurShapeF = \shape #'((0 . -2.5) (0 . 2.5) (0 . 0) (0 . 0)) \etc
slurShapeG = \shape #'((0 . -2) (-1 . 2) (0 . 0) (0 . -2)) \etc
slurShapeH = \shape #'((-1 . 3) (0 . -3) (0 . -0.5) (0 . 1)) \etc
slurShapeI = \shape #'((-1 . 3) (0 . -3) (0 . -0.5) (0 . 1)) \etc
slurShapeJ = \shape #'((0 . -7) (0 . -2) (0 . 1) (0 . 0)) \etc
slurShapeK = \shape #'(
                        ((0 . 0) (0 . 0) (0 . -0.5) (0 . -1.25))
                        ((0 . -0.5) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeL = \shape #'((0 . -1.5) (0 . 1) (0 . 1) (0 . -1)) \etc

moveTextA = \tweak Y-offset 4 \etc

%%% Music %%%

global = {
  \key bf \major
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  R2. |
  bf'4( ef) r4 r r |
  a,4( bf c |
  f1.) |
  \textMark \aTempo R2. |
  ef4( af) r r r |
  d,4( ef f |
  bf2.~ bf2^\rit a8 g) |
  
  \barNumberCheck 9
  \textMark \aTempo r4 r d8( c bf4 bf') |
  r4 r8 d,( c bf a4 a') |
  r4 r8 c,-\slurShapeG ( bf a g4 g' |
  f,4 f'~ f d c) |
  R2. |
  bf4( ef) r4 r r |
  a,4( bf c |
  f1.) |
  
  \barNumberCheck 17
  \textMark \aTempo R2. |
  ef4( af) r r r |
  d,4( ef f |
  bf2. \after 4 ^\rit bf,) |
  \textMark \aTempo r4 r f'8( ef d4 d') |
  r4 r8 f,8( ef[ d] c4 c') |
  r4 r8 f,8( ef[ d] c4 c' |
  f,,4 f' ef2 d4) |
  
  \barNumberCheck 25
  d4-\slurShapeL ( c bf'~ bf \textInsideSlur a8[-\moveTextA ^\dolciss g c, d] |
  f8 d bf4 bf') |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  r4 r8 bf,-\slurShapeA ( f'[ ef'] |
  d8[ c g bf' ef, g,]) r bf,-\slurShapeB ( f'[ ef'] |
  d8[ c f, a' ef f,]) |
  r8 bf,-\slurShapeC ( f'[ d' c bf]  af[ \staffUp f' d'^\rit c] bf4) |
  \staffDown r4 r8 \clef treble ef,,8( bf'[ af'] |
  % SrcB g-> bf, fifth beat
  g8[ f c ef' af, c,]) r ef,( bf'[ af'] |
  g8[ f bf, d' af bf,]) |
  r8 ef,( bf'[ g' f ef]  df[ bf' g' f] ef4) |
  
  \barNumberCheck 9
  \clef bass r8 d,,-\slurShapeD ( bf'[ g'] f[ ef g bf, g' d']) |
  r8 d,,-\slurShapeE ( a'[ f'] ef[ d f a, f' d']) |
  r8 d,,-\slurShapeF ( g[ ef'] d[ c ef a, ef' bf'] |
  a8[-- d,-- a-- d,]-- f ef' a4) r |
  r4 r8 bf,,-\slurShapeH ( f'[ ef'] |
  d8[ c g bf' ef, g,]) r bf,-\slurShapeI ( f'[ ef'] |
  d8[ c f, a' ef f,]) |
  r8 bf,-\slurShapeJ ( f'[ d' c bf]  af[ \staffUp f' d'^\rit c] bf4) |
  
  \barNumberCheck 17
  \staffDown r4 r8 \clef treble ef,,8-\slurShapeK ( bf'[ af'] |
  g8[ f c ef' af, c,]) r ef,( bf'[ af'] |
  g8[ f bf, d' af bf,]) |
  r8 ef,( bf'[ g'] f[ ef]  e,[ cs' bf'8. af16] gf4) |
  r8 f,( d'[ bf'] a[ g bf f bf f']) |
  r8 f,,( c'[ bf'] g[ f bf ef, g ef']) |
  r8 f,,( c'[ bf'] gf[ f bf ef, gf ef']) |
  r8 a,( ef[ f,] fs[ ef' c' g, f' b] |
  
  \barNumberCheck 25
  ef,,8[ g g' c,] c'4 f,,8 ef' a4) r |
  \clef bass bf,,8[( f' d' f,] d''4) |
}

dynamics = {
  \tag layout { s2. | } \tag midi { s2.\p | }
  s1 s4 |
  s2.\< |
  s16 s8.\> s2 s8\! s4. s4 |
  s2. |
  s1 s4 |
  s2. |
  s1. |
  
  \barNumberCheck 9
  \repeat unfold 4 { s1 s4 | }
  s2. |
  s1 s4 |
  s2.\< |
  s16 s8.\> s2 s8\! s4. s4 |
  
  \barNumberCheck 17
  s2. |
  s1 s4 |
  s2.\< |
  s16 s8.\> s2 s8\! s4. s4 |
  s8 s\pp s1 |
  s1 s4 |
  s4. s8\< s2.
  s16 s8.\> s1 <>\! |
  
  \barNumberCheck 25
  s1.\pp |
  s2. |
}

% MIDI only 
pedal = {
  s4. s\sd |
  s2. s8\su s4.\sd |
  s2. |
  s8\su s\sd s1 s4 |
  s4.\su s\sd |
  s2. s8\su s4.\sd |
  s2. |
  s8\su s\sd s1 s4 |
  
  \barNumberCheck 9
  s8\su s4.\sd s2. |
  s8\su s4.\sd s2. |
  s8\su s4.\sd s2. |
  s2.\su\sd s4 s\su |
  s4. s\sd |
  s2. s8\su s4.\sd |
  s2. |
  s8\su s\sd s1 s4 |
  
  \barNumberCheck 17
  s4.\su s\sd |
  s2. s8\su s4.\sd |
  s2. |
  s8\su s4.\sd s4 s2.\su\sd |
  s8\su s4.\sd s2. |
  s8\su s4.\sd s2. |
  s8\su s4.\sd s2. |
  s8\su s4.\sd s\su\sd s\su\sd |
  
  \barNumberCheck 25
  s2.\su\sd s2\su\sd s4\su |
  s2.\sd |
}

tempi = {
  \textMark \markup \tempo-markup Andante #2 #0 108
  \set Score.tempoHideNote = ##t
  \tempo 4 = 100
  s2. |
  s1 s4 |
  s2. |
  s1 \tempo 4 = 92 s2 |
  \tempo 4 = 100 s2. |
  s1 s4 |
  s2. |
  s2. \tempo 4 = 92 s2 \tempo 4 = 84 s4 |
  
  \barNumberCheck 9
  \tempo 4 = 100
  \repeat unfold 4 { s1 s4 | }
  s2. |
  s1 s4 |
  s2. |
  s1 \tempo 4 = 92 s2 |
  
  \barNumberCheck 17
  \tempo 4 = 100 s2. | 
  s1 s4 |
  s2. |
  s1 \tempo 4 = 92 s2 |
  \tempo 4 = 100
  \repeat unfold 4 { s1 s4 | }
  
  \barNumberCheck 25
  s1 \tempo 4 = 92 s2 |
  s4 \tempo 4 = 84 s2 |
}

forceBreaks = {
  s2. |
  s1 s4 |
  s2. |
  s1. | \break
  s2. |
  s1 s4 |
  s2. |
  s1. | \break
  
  \barNumberCheck 9
  \repeat unfold 4 { s1 s4 | } \break
  s2. |
  s1 s4 |
  s2. |
  s1. |
  
  \barNumberCheck 17
  s2. | \break
  s1 s4 |
  s2. |
  s1. |
  s1 s4 | \break
  \repeat unfold 3 { s1 s4 | }
  
  \barNumberCheck 25
  s1. |
  s2. |
}

timeSignatures = {
  \time 3/4 s2. |
  \time 5/4 s1 s4 |
  \time 3/4 s2. |
  \time 6/4 s1. |
  \time 3/4 s2. |
  \time 5/4 s1 s4 |
  \time 3/4 s2. |
  \time 6/4 s1. |
  
  \barNumberCheck 9
  \time 5/4 \repeat unfold 4 { s1 s4 | }
  \time 3/4 s2. |
  \time 5/4 s1 s4 |
  \time 3/4 s2. |
  \time 6/4 s1. |
  
  \barNumberCheck 17
  \time 3/4 s2. |
  \time 5/4 s1 s4 |
  \time 3/4 s2. |
  \time 6/4 s1. |
  \time 5/4 \repeat unfold 4 { s1 s4 | }
  
  \barNumberCheck 25
  \time 6/4 s1. |
  \time 3/4 s2. |
}

preludeTwentyOneNotes =
\score {
  \header {
    title = "21."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 21"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
    \new Devnull \timeSignatures
  >>
  \layout {}
}

\include "articulate.ly"

preludeTwentyOneMidi =
\book {
  \bookOutputName "prelude-op11-no21"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << 
        \rightHand \timeSignatures \dynamics \pedal \tempi
      >>
      \new Staff = "lower" << 
        \leftHand \timeSignatures \dynamics \pedal \tempi
      >>
    >>
    \midi {}
  }
}
