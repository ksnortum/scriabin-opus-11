%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

moveNoteA = \tweak NoteColumn.X-offset 0.5 \etc
moveNoteB = \tweak NoteColumn.X-offset -0.25 \etc

slurShapeA = \shape #'((0 . 2) (0 . 2) (0 . 2) (0 . 2)) \etc

%%% Music %%%

global = {
  \time 3/4
  \key g \minor
  \accidentalStyle piano
}

rightHandUpper = \relative { 
  \voiceOne
  d''8(^\rubato c ef bf d c |
  <d, bf'>4 a'2 |
  bf8[ a] bf[ f] a[ gf] |
  g2 fs4 |
  g2. |
  g4 af g |
  g4 d' c |
  bf4 a4. a8 |
  
  \barNumberCheck 9
  a8 g bf f a g |
  <a, f'>4 e'2 |
  f8[ e] f[ c] e[ df] |
  d2 cs4 |
  \after 4. ^\accel d2.~ |
  d4 ef d) |
  \oneVoice r4 <g, g'>2~-\slurShapeA ^(^\accel |
  q4 <af af'> <g g'>) |
  
  \barNumberCheck 17
  r4 <g g'>(^\accel <af af'>) |
  r4 <af af'>( <bf bf'>) |
  r4 <bf bf'>( <a a'>8) <g' a cs>\noBeam |
  q2.\fermata |
  \voiceOne d'8-.(^\aTempo c-. ef-. bf d^\accel c |
  bf8 a c g bf^\rit a |
  \oneVoice g4)\fermata r r |
  <a, d fs>4 r r |
  <bf d g>2 r4 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  <ef' bf'>2 <ef a>4 |
  bf'8 \moveNoteA g <c, g'>4 q |
  <bf gf'>4 <bf f'> <bf e> |
  <bf ef>4 <a ef'> d |
  <d f>4 <c f> q |
  <b f'> <b d> q |
  c4 << { b4 c } \new Voice { \voiceFour g'2 } >> |
  <d fs>2 <a f'>4 |
  
  \barNumberCheck 9
  <bf f'>2 <bf e>4 |
  f'8 d <g, d'>4 q |
  <f df'>4 <f c'> <f b> |
  <f bf>4 <e bf'> a |
  <a c>4 <g c> q |
  <fs c'>4 q q |
  s4 d'4 df |
  c8 b f'2 | |
  
  \barNumberCheck 17
  s4 ef2 |
  s4 g2 |
  s4 \moveNoteB g4. s8 |
  s2. |
  <g bf>2 <ef g>4 |
  q2 <c g'>4~ |
  c4 s2 |
  s2. * 2 |
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

leftHand = \relative {
  \global
  \clef bass
  g2 fs4~ |
  fs8 g-- f4.-> ef8-- |
  d2-- d4~ |
  d4 c4. b8 |
  b8 c g'4. df8 |
  df8 d f2 |
  ef2. |
  d2. |
  
  \barNumberCheck 9
  d2 cs4~ |
  cs8 d c4. bf8 |
  a2 a4~ |
  a4 g4. fs8 |
  fs8 g~ <g d'>4. af8 |
  af8 a~ <a fs'>4. a8 |
  a8 bf~ <bf f'>4. b8 |
  c8 df~ <df b'>4. d8 |
  
  \barNumberCheck 17
  d8 ef~ <ef c'>4. d8 |
  d8 ef~ <ef c'>4. d8 |
  d8 ef~ <ef cs'>4. ef'8 |
  ef2.\fermata |
  d8 ef c4 g8 a |
  bf8 c a4 ef~ |
  ef4\fermata r r |
  d4 r r |
  <g,, g' d'>2\arpeggio r4 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.\p |
  s2. * 4 |
  s2.\< |
  s8 s\! s2\> |
  s2 s4\pp |
  
  \barNumberCheck 9
  s2. * 5 |
  s2.\cresc |
  s2. * 2 |
  
  \barNumberCheck 17
  s4 s\> s\! |
  s4 s\> s\! |
  s4\p s4.\> s8\pp |
  s2.\pp |
  s2.^\ppRubato |
  s2. * 2 |
  s2.\ppp |
  s2. |
}

tempi = {
  \textMark \markup \tempo-markup Lento #2 #0 76
  \set Score.tempoHideNote = ##t
  \tempo 4 = 76
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 4 |
  s4 \tempo 4 = 84 s2 |
  s2. |
  s4 \tempo 4 = 96 s2 |
  s2. |
  
  \barNumberCheck 17
  s4 \tempo 4 = 104 s2 |
  s2. |
  s4 \tempo 4 = 112 s2 |
  \tempo 4 = 60 s2. |
  \tempo 4 = 84 s2 \tempo 4 = 96 s4 |
  s2 \tempo 4 = 84 s4 |
  \tempo 4 = 60 s4 \tempo 4 = 84 s2 |
  s2. * 2 |
}

forceBreaks = {
  s2. * 4 s2. \break
  s2. * 4 s2. \break
  s2. * 4 s2. \break
  s2. * 4 s2. \break
}

preludeTwentyTwoNotes =
\score {
  \header {
    title = "22."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 22"
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

preludeTwentyTwoMidi =
\book {
  \bookOutputName "prelude-op11-no22"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \tempi >>
    >>
    \midi {}
  }
}
