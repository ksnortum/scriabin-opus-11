%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'(
                        ((0 . 3) (0 . -0.5) (0 . -0.5) (0 . 0))
                        ((0 . 0) (0 . -0.5) (0 . -0.25) (0 . 0))
                        ) \etc
slurShapeB = \shape #'(
                        ()
                        ()
                        ((0 . 0) (0 . 0) (0 . 0) (-1 . -2))
                        ) \etc
slurShapeC = \shape #'(
                        ()
                        ()
                        ((0 . 0) (0 . 0) (0 . -1) (0 . -1.5))
                        ) \etc

beamPositionsA = \tweak Beam.positions #'(-3 . -3.5) \etc

moveTextA = \tweak Y-offset 7.5 \etc

%% Music %%%

global = {
  \time 3/4
  \key gf \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  <bf gf' bf>2-\slurShapeB ^( q4 | 
  \voiceOne df'4. cf8\noBeam bf af |
  ef'2 f4 |
  af2 af,4 |
  bf8 cf ef4 cf |
  af8 bf df4 gf, |
  gf8 af df4. cf8 |
  bf8 af ef' c ef df |
  
  \barNumberCheck 9
  <bf, gf' bf>2 q4 |
  \voiceOne df'4. cf8\noBeam bf af |
  ef'2 f4 |
  af2 af,4 |
  bf8 cf ef4 cf |
  af8 bf df4 gf, |
  gf8 af df4. cf8 |
  f,8 gf bf2 |
  
  \barNumberCheck 17
  c8 d ef4 <gf, a c> |
  <d bf' d f>2.)\fermata-\moveTextA ^\rit |
  c'8( df ff4 <ef, cf' ef> |
  <d af' bf>8_- <df g cf>_- <cf af'>2_- |
  g'8 af cf4 gf |
  g8 af cf4 <bf, gf' bf> |
  f'8 gf <bf, gf' bf>2) |
  \oneVoice r4 \voiceOne <gf' df'>( <f af> | 
  
  \barNumberCheck 25
  \oneVoice <bf, gf' bf>2 q4 |
  \voiceOne df'4. cf8\noBeam bf af |
  ef'2 f4 |
  gf2. |
  ef2 f4 |
  gf2 f4^\rit |
  gf2.) |
  \oneVoice R2. |
  R2. |
  <cf,, f af>4 r r |
  <bf gf' bf>2. |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo s2. |
  << { ef'2. | } \new Voice { \voiceFour gf2~ gf8 af | } >> 
  af2 <af ef'>4 |
  << 
    { af2 f4 | } 
    \new Voice { \voiceFour ef'4. d8\noBeam \beamPositionsA cf bf | } 
  >>
  <ef, g>2 <ef af>4 |
  <df af'>4 <bf gf'>2 |
  <cf ef>4 <ef gf>2 |
  gf4 f2 |
  
  \barNumberCheck 9
  s2. |
  << { ef2. | } \new Voice { \voiceFour gf2~ gf8 af | } >> 
  af2 <af ef'>4 |
  << 
    { af2 f4 | } 
    \new Voice { \voiceFour ef'4. d8\noBeam \beamPositionsA cf bf | } 
  >>
  <ef, g>2 <ef af>4 |
  <df af'>4 <bf gf'>2 |
  <cf ef>4 <ef gf>2 |
  d4 <d f> ef |
  
  \barNumberCheck 17
  <d af'>4 <gf~ bf> \hideNoteHead gf |
  s2. |
  <ff bf>4~ q s |
  s2. |
  <cf f>4~ q gf' |
  <cf, f>4~ q s |
  <a ef'>4 s2 |
  s4 cf2 |
  
  \barNumberCheck 25
  s2. |
  << { ef2. | } \new Voice { \voiceFour gf2~ gf8 af | } >> 
  af2 <af df>4 |
  <gf df'>2. |
  af2 <af df>4 |
  <gf df'>2 <af df>4 |
  <gf df'>2. |
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
  r8 c(\noBeam df f gf ef |
  af,8 ef' af ef df' cf |
  cf8 bf df f, cf' df |
  cf8 bf gf' f ef d |
  df4 cf8[ bf] af[ gf] |
  gf8[ f] ef[ bf] ef[ df'] |
  bf,8 cf' af, ef' af ef_~ |
  <ef cf'~>4 <df cf'>2) |
  
  \barNumberCheck 9
  r8 c-\slurShapeA (\noBeam df f gf ef |
  af,8 ef' af ef df' cf |
  cf8 bf df f, cf' df |
  cf8 bf gf' f ef d |
  df4 cf8[ bf] af[ gf] |
  gf8[ f] ef[ bf] ef[ df'] |
  bf,8 cf' af, ef' cf' ef, |
  af,8 bf gf bf bf' bf, |
  
  \barNumberCheck 17
  f8 bf ef, bf' bf' bf, |
  bf,8 bf'-> f'-> d'-> bf'4->)\fermata |
  g,4-\slurShapeC ( af8[ g] af[ gf] |
  f8[ ff] ef d ff ef |
  d4 ef8 d ef cf' |
  d,4 ef8[ d] ef df |
  c4 << { df'2 } \\ { df8 df, gf df } >> |
  << { df'2. | } \\ { df8 df, af' df, ef df | } >>
  
  \barNumberCheck 25
  gf,8 c df f gf ef |
  gf,8 ef' af ef df' cf |
  cf8 bf df df, cf' df |
  cf8 bf df, gf, df' bf' |
  cf8 bf df df, cf' df |
  cf8 bf df, gf, cf' df |
  cf8 bf df, gf, df' bf' |
  <<
    { df2.->~ | df2.~^\md | \voiceThree df2.~ | df2.) | }
    \new Voice { \voiceFour s2. | s2. | <df,, df'>4 r r | <gf df'>2. | }
  >> 
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2\p s4\< |
  s16 s8.\! s2 |
  s2 s4\< |
  s16 s8.\! s2 |
  s2. * 3 |
  s4 s4.\> s8\! |
  
  \barNumberCheck 9
  s2-\tweak X-offset 0 \pp s4\< |
  s16 s8.\! s2 |
  s2\< s4\! |
  s2. |
  s2.\cresc |
  s2. * 3 |
  
  \barNumberCheck 17
  s2.\cresc |
  s2.\f |
  s2.\p |
  s2. |
  s8\< s\! s4\> s\! |
  s8\< s\! s4\> s\! |
  s8 s\< s2 |
  s8 s\! s8 s4\> s8\! |
  
  \barNumberCheck 25
  s2-\tweak X-offset 0 \pp s4\< |
  s16 s8.\! s2 |
  s2.\> |
  s16 s8.\! s2 |
}

% MIDI only
pedal = {
  s4\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s2\su\sd |
  s4\su\sd s2\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 9
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s2\su\sd |
  s4\su\sd s2\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 17
  s4\su\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s4\su\sd s2\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 25
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su\sd |
  s2.\su\sd |
  s2. * 2 |
  s2.\su |
}

tempi = {
  \textMark \markup \tempo-markup Lento #2 #0 76
  \set Score.tempoHideNote = ##t
  \tempo 4 = 76
  s2. * 7 |
  s4. \tempo 4 = 69 s |
  
  \barNumberCheck 9
  \tempo 4 = 76
  s2. * 8 |
  
  \barNumberCheck 17
  s2. |
  \tempo 4 = 48
  s2 \tempo 4 = 20 s4 |
  \tempo 4 = 76 
  s2. * 6 |
  
  \barNumberCheck 25
  s2. * 5 |
  s2 \tempo 4 = 69 s4 |
  s2. |
  \tempo 4 = 76
  s2. |
}

preludeThirteenNotes =
\score {
  \header {
    title = "13."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 13"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

preludeThirteenMidi =
\book {
  \bookOutputName "prelude-op11-no13"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \tempi \pedal >>
    >>
    \midi {}
  }
}
