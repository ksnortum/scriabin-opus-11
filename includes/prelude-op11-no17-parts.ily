%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%% Music %%%

tempoMarkup = 
\markup {
  \large
  "Allegretto"
  \hspace #0.4
  \small {
    \raise #0.4
    \note { 4 } #UP 
    \normal-text
    "= 92"
  }
}

global = {
  \time 6/4
  \key af \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  ef''4(^\accel f af af,^\rit bf df) |
  r4^\aTempo \voiceOne ef( af,) \oneVoice r r2 |
  c4(^\accel df f f,^\rit g bf) |
  r4^\aTempo \voiceOne c( f,) \oneVoice r4 r2 |
  r4 af(^\conAnima f) r ff( bf) |
  r4 c( ef,) r df( f') |
  ef4( f af af, bf df) |
  r4 \voiceOne ef( af,) \oneVoice r r2 |
  
  \barNumberCheck 9
  r4 af( f) r ff( bf) |
  r4 c( ef,) r df( f') |
  ef4-.( f-.^\rit af af, bf df8.)\fermata r16 |
  r4^\aTempo \voiceOne ef( af,) \oneVoice r r2 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo 
  s1. |
  s4 g'( af) s2. |
  s1. |
  s4 e( f) s2. |
  s1. * 3 |
  s4 g( af) s2. |
  
  \barNumberCheck 9
  s1. * 3 |
  s4 g( af) s2. |
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
  s1. |
  \clef bass r4 df'( c) r df( c) |
  s1. |
  r4 bf( af) r bf( af) |
  r4 af2 r4 af2 |
  r4 af2 s2. |
  s1. |
  r4 df( c) r df( c) |
  
  \barNumberCheck 9
  r4 af2 r4 af2 |
  r4 af2 s2. |
  s1. |
  r4 df( c) r df( c) |
}

leftHandLower = \relative {
  \bassToTreble
  <ef' af c>4-.( <d af' cf>-. <df af' bf>-. <c ef af>-. <af df ff>-.
    <ff bf df af'>-.) |
  \clef bass \voiceFour ef,4( ef'2) af,4( ef'2) |
  \clef treble \oneVoice <c' f af>4-.( <b f' af>-. <bf f' g>-. <af c f>-.
    \clef bass <f bf df>-. <df g bf f'>-.) |
  \voiceFour c,4( c'2) f,4( c'2) |
  df,4( af' df) df,( af' df) |
  c,4( af' ef') \oneVoice bf,( <bf' af'> \clef treble <bf' af'df>) |
  <ef af c>4-.( <d af' cf>-. <df af' bf>-. <c ef af>-. <af df ff>-.
    <ff bf df af'>-.) |
  \clef bass \voiceFour ef,4( ef'2) af,4( ef'2) |
  
  \barNumberCheck 9
  df,4( af' df) df,( af' df) |
  c,4( af' ef') \oneVoice bf,( <bf' af'> \clef treble <bf' af'df>) |
  <ef af c>4-.( <d af' cf>-. <df af' bf>-. <c ef af>-. <af df ff>-.
    <ff bf df af'>8.-.)\fermata r16 |
  \clef bass \voiceFour ef,4( ef'2) af,4( ef' af) |
}

leftHand = {
  \global
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s1.\p |
  s1. * 3 |
  s4 s2\cresc s2. |
  s2. s4 s\> s\! |
  s1.\p |
  s1. |
  
  \barNumberCheck 9
  s4 s2\cresc s2. |
  s2. s4 s\> s\! |
  s1.\pp |
  s1.-\tweak X-offset 0 \ppp |
}

% MIDI only
pedal = {
  s4\sd s\su\sd s\su\sd s\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su s2\sd s4\su |
  s4\sd s\su\sd s\su\sd s\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su s2\sd s4\su |
  s2.\sd s\su\sd |
  s2.\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd s\su\sd s\su\sd s\su\sd |
  s2\su\sd s4\su s2\sd s4\su |
  
  \barNumberCheck 9
  s2.\sd s\su\sd |
  s2.\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd s\su\sd s\su\sd s8.\su\sd s16\su |
  s2\sd s4\su s2\sd s4\su |
}

tempi = {
  \textMark \markup \tempo-markup Allegretto #2 #0 92
  \set Score.tempoHideNote = ##t
  \tempo 4 = 112
  s4 \tempo 4 = 120 s \tempo 4 = 126 s \tempo 4 = 120 s \tempo 4 = 112 s 
    \tempo 4 = 104 s |
  \tempo 4 = 112 s1. |
  s4 \tempo 4 = 120 s \tempo 4 = 126 s \tempo 4 = 120 s \tempo 4 = 112 s 
    \tempo 4 = 104 s |
  \tempo 4 = 112 s1. |
  s1. * 2 |
  s4 \tempo 4 = 120 s \tempo 4 = 126 s \tempo 4 = 120 s \tempo 4 = 112 s 
    \tempo 4 = 104 s |
  \tempo 4 = 112 s1. |
  
  \barNumberCheck 9
  s1. * 2 |
  s4 \tempo 4 = 120 s \tempo 4 = 126 s \tempo 4 = 120 s \tempo 4 = 112 s 
    \tempo 4 = 60 s |
  \tempo 4 = 112 s1. |
}

forceBreaks = {
  s1. \noBreak
  s1. \noBreak
  s1. \break
  s1. \noBreak
  s1. \noBreak
  s1. \break
  s1. \noBreak
  s1. \noBreak
  s1. \break
  s1. \noBreak
  s1. \noBreak
  s1. 
}

preludeSeventeenNotes =
\score {
  \header {
    title = "17."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 17"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \override StaffGrouper.staff-staff-spacing.padding = 5
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeSeventeenMidi =
\book {
  \bookOutputName "prelude-op11-no17"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
