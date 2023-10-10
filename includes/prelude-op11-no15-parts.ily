%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

forceHShiftA = \tweak NoteColumn.force-hshift -0.15 \etc

moveFingerA = \tweak Y-offset 0.25 \etc

%% Music %%%

global = {
  \time 4/4
  \key df \major
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  \textMark \markup \tempo-markup Lento #3 #0 80-76
  \set Score.tempoHideNote = ##t
  \tempo 4 = 60
  R1 * 8 |
  
  \barNumberCheck 9
  df''2( af' |
  << { \voiceTwo bf,4 gf' f4. ef8 } \new Voice { \voiceOne bf1 } >> |
  ef2 bf' |
  << { c,4 af' gf4. f8 } \new Voice { \voiceOne c1 } >> |
  f8) \oneVoice f4( f8 f4. af8 |
  df,8 ef4 ef8 ef4. gf8 |
  c,8 df4 df8 c df4 df8 |
  bf8 ef4 ef8 ef df af4~ |
  
  \barNumberCheck 17
  af8)\noBeam <f af>( <c ef> <f af> <ef c'> <f af> <ef c'> <f af> |
  <df bf'>8 <ef gf> <bf df> <ef gf> <df bf'> <ef gf> <df bf'> <ef gf> |
  <c af'>8 <df f> <af c> < df f> <c af'> <df f> <c af'> <df f> |
  <bf gf'>8 <df f> <af c> <df f> <c af'> <df f> <c af'> <df f> |
  <bf gf'>8 <df f> <c af'> <df f> <bf gf'> <df f> <c af'> <df f> |
  % Use fingering as left-hand indicator
  <bf gf'>8 <df f> <c ef>2 \set fingeringOrientations = #'(left)
    <df-\moveFingerA\finger\lhMark>4 ) |
  df'2( af' |
  <<
    { \voiceTwo bf,4 gf' f4. ef8 | ef1 | }
    \new Voice { \voiceOne bf1_~ | \forceHShiftA bf1 | }
  >> 
  \oneVoice <c ef>1 |
  <df f>1~ |
  q1) |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  r8 <bf df>( <f af> <bf df>  <c ef> <af af'> <df f> <bf df> |
  <ef gf>1) |
  r8 <c ef>( <gf bf> <c ef> <df f> <bf bf'> <ef gf> <c ef> |
  \clef treble <f af>1) |
  r8 <df f>( <af c> <df f> <c af'> <df f> <c af'> <df f> |
  <bf gf'>8 <c ef> <gf bf> <c ef> <bf gf'> <c ef> <bf gf'> <c ef> |
  <af f'>8 <bf df> <f af> <bf df> <af f'> <bf df> <f af> < bf df> |
  <gf ef'>8 <bf df> <af c>2 <bf df>4) |
  
  \barNumberCheck 9
  \clef bass r8 <bf df>(\pp <f af> <bf df>  <c ef> <af af'> <df f> <bf df> |
  <ef gf>1) |
  r8 <c ef>( <gf bf> <c ef> <df f> <bf bf'> <ef gf> <c ef> |
  \clef treble <f af>1) |
  r8 <df f>( <af c> <df f> <c af'> <df f> <c af'> <df f> |
  <bf gf'>8 <c ef> <gf bf> <c ef> <bf gf'> <c ef> <bf gf'> <c ef> |
  <af f'>8 <bf df> <f af> <bf df> <af f'> <bf df> <f af> < bf df> |
  <gf ef'>8 <bf df> <gf ef'> <bf df> <af c> <bf df> <c ef> <df f> |
  
  \barNumberCheck 17
  <df f>4) \clef bass f,4->~\mp f4. f8 |
  bf8 r ef,4->~ ef4. ef8 |
  f4-> f~ f f8-- bf,-- |
  ef8 r f4~ f f8 bf, |
  ef4 f8 bf, ef4 f8-> bf,-> |
  ef4-> af2 bf4 |
  r8 <bf df>( <f af> <bf df> <c ef> <af af'> <df f> <bf df> |
  <ef gf>1~ |
  q1) |
  <af, af'>1 |
  <df af'>1~ |
  q1 |
}

dynamics = {
  \override Score.DynamicTextSpanner.style = #'none
  s1\pp |
  s1 * 4 |
  s1\cresc |
  s2 s\dim |
  s4 s2\> s8 s\! |
  
  \barNumberCheck 9
  s1\mf |
  s1 * 3 |
  s4. s8\cresc s2 |
  s1 |
  s2 s8 s4.\dim |
  s4. s8\> s2 |
  
  \barNumberCheck 17
  s16 s\! s4.\pp s2 |
  
}

forceBreaks = {
  s1 * 4 | s1 \break
  s1 * 3 | s1 \break
  s1 * 3 | s1 \break
  s1 * 3 | s1 \break
  s1 * 3 | s1 \break
}

preludeFifteenNotes =
\score {
  \header {
    title = "15."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 15"
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

preludeFifteenMidi =
\book {
  \bookOutputName "prelude-op11-no15"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics >>
      \new Staff = "lower" << \leftHand \dynamics >>
    >>
    \midi {}
  }
}
