%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

moveAccidentalA = \tweak Accidental.X-offset 1 \etc
moveAccidentalB = \tweak Accidental.X-offset -2 \etc

moveTieA = 
  \once \override TieColumn.tie-configuration = #'((5.5 . -1) (-2.0 . -1))
moveTieB = 
  \once \override TieColumn.tie-configuration = #'((3.5 . -1) (-2.0 . -1))
moveTieC = 
  \once \override TieColumn.tie-configuration = #'((5.0 . 1) (-2.0 . -1))

%% Music %%%

tempoMarkup = 
\markup {
  "Presto"
  \hspace #0.4 \teeny
  \rhythm {
    \override Score.SpacingSpanner.spacing-increment = 0.5
    4.~ 4 
  }
  \small \normal-text "= 69-72"
}

global = {
  \time 3,2,3,2,3,2 15/8
  \key ef \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Score.tempoHideNote = ##t
  \tempo \tempoMarkup $#{ 8*5 #} = 69 % 4. + 4 = 69
  \partial 8 r8 
  r8 bf <gf ef'> <gf bf ef f>4->  r8 bf <ef gf> <bf ef f af>4->  
    r8 ef <bf bf'> <cf ef cf'>4-> |
  r8 ef <bf bf'> <a ef' a> <ef' ef'>[\sf  q]\sf ef <af, af'> <g ef' g>4 
    r8 ef' <gf, gf'> <f d' f>4 |
  r8 bf <gf ef'> <gf bf ef f>4->  r8 bf <ef gf> <bf ef f af>4->  
    r8 ef <bf bf'> <cf ef cf'>4-> |
  r8 ef <bf bf'> <a ef' a> <ef' ef'>[\sf  q]\sf ef <af, af'> <g ef' g>4 
    r8 ef' <gf, gf'> <f d' f>4 |
  r8 bf <d bf'> <cf d cf'>4  r8 cf <ef cf'> <d af' bf d>4
    r8 ef <af cf ef> <gf cf ef gf>4 |
  r8 ef <g ef'> <ff g \moveAccidentalA ff'>4  r8 \voiceOne ff <af ff'> 
    \oneVoice <g df' ef g>4  r8 af <df ff af> <cf ff af cf>4 |
  r8 cf <ef gf cf> <bf ef gf bf>4  r8 ef, <bf' ef> <bf, ef bf'>4
    r8 f <ef' f> <gf, ef' gf>4 |
  r8 bf <d af' bf> <cf d af' cf>4  r8 d <af' cf> <d, af' bf d>4
    r8 d <af' bf d> <gf bf d gf>4 |
  
  \barNumberCheck 9
  r8 bf <gf ef'> <gf bf ef f>4  r8 bf <ef gf> <bf ef f af>4
    r8 ef <bf bf'> <cf ef cf'>4 |
  r8 ef <bf bf'> <a ef' a> <ef' ef'>[  q] ef <af, af'> <g ef' g>4
    r8 ef' <gf, gf'> <f d' f>4 |
  r8 bf <gf ef'> <gf bf ef f>4  r8 bf <ef gf> <bf ef f af>4
    r8 ef <bf bf'> <cf ef cf'>4 |
  r8 ef <bf bf'> <a ef' a> <ef' ef'>[  q] ef <af, af'> <g ef' g>4
    r8 ef' <gf, gf'> <f d' f>4 |
  r8 bf <d bf'> <cf d cf'>4  r8 cf <ef cf'> <d af' bf \moveAccidentalB d>4
    r8 ef <af cf ef> <gf cf ef gf>4 |
  r8 \ottava 1 ef <g ef'> <ff g \moveAccidentalA ff'>4  r8 \voiceOne 
    ff <af ff'> \oneVoice <g df' ef g>4 r8 af <df ff af> <cf ff af cf>4 |
  r8 cf <ef gf cf> <bf ef gf bf>4  r8 ef, <bf' ef> <bf, ef bf'>4
    \ottava 0 r8 f <bf ef f> <gf bf ef gf>4 |
  r8 cf <ef gf cf> <bf ef gf bf>4  r8 ef, <bf' ef> <bf, ef bf'>4
    r8 f <ef' f> <gf, ef' gf>4 |
  
  \barNumberCheck 17
  r8 \clef bass ef <af cf ef> <d, af' cf d>4  r8 ef <af cf ef> <d, af' cf d>4
    r8 af' <d af'> <d, af' d>4 |
  r8 ef <af cf ef> <d, af' cf d>4  r8 ef <af cf ef> <d, af' cf d>4
    r8 af' <d af'> <d, af' d>4 |
  r8 \clef treble ef <af cf ef> <cf ef f>4  r8 af <ef' f af> q4
    r8 ef <af ef'> <ef af ef'>4 |
  r8 ef <af cf ef> <f cf' ef f>4  r8 af <ef' f af> <af, ef' f af>4
    r8 ef' <af ef'> <f af ef' f>4 |
  r8 bf <ef f> <bf ef gf>4  r8 \voiceOne ef, <gf cf> \oneVoice <ef gf bf>4
    r8 bf <ef f> <bf ef gf>4 |
  r8 ef, <gf cf> <ef gf bf>4  r8 bf <ef f> <bf ef gf>4
    r8 \clef bass ef, <gf cf> <ef gf bf>4 |
  r8 bf <ef f> <bf ef gf>4  r8 bf <ef f> <bf ef gf>4  q8[-> q-> q-> q-> q]-> |
  q1->\fermata
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  \partial 8 s8
  s8 bf4 s  s8 bf4 s  s8 ef4 s |
  s8 ef4 s  s8 ef4 s  s8 ef4 s |
  s8 bf4 s  s8 bf4 s  s8 ef4 s |
  s8 ef4 s  s8 ef4 s  s8 ef4 s |
  s8 bf4 s  s8 cf4 s  s8 ef4 s |
  s8 ef4 s  s8 ff4 s  s8 \voiceOne af4 s |
  s8 cf4 s  s8 \voiceTwo ef,4 s  s8 f,4 s |
  s8 bf4 s  s8 d4 s  s8 d4 s |
  
  \barNumberCheck 9
  \voiceOne s8 bf'4 s  s8 bf4 s  s8 ef4 s4 |
  s8 ef4 s  s8 ef4 s  s8 ef4 s |
  s8 bf4 s  s8 bf4 s  s8 ef4 s4 |
  s8 ef4 s  s8 ef4 s  s8 ef4 s |
  s8 bf4 s  s8 cf4 s  s8 ef4 s |
  s4. s4  s8 \voiceTwo ff4 s  s8 \voiceOne af4 s |
  s8 cf4 s  s8 \voiceTwo ef,4 s  s8 \voiceOne f,4 s |
  s8 cf'4 s  s8 \voiceTwo ef,4 s  s8 f,4 s |
  
  \barNumberCheck 17
  s8 \voiceOne ef4 s  s4. s4  s8 af4 s |
  s8 ef4 s  s8 ef4 s  s8 af4 s |
  s8 \voiceTwo ef4 s  s8 af4 s  s8 ef'4 s |
  s8 ef4 s  s8 \voiceOne af4 s  s8 ef'4 s |
  s8 bf'4 s  s8 \voiceTwo ef,4 s  s8 \voiceOne bf4 s |
  s8 \voiceTwo ef,4 s  s8 bf4 s  s8 \voiceOne ef,4 s |
  s8 bf4 s  s8 bf4 s  s4. s4 |
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
  \partial 8 s8
  s1 * 15/8 * 8 |
  
  \barNumberCheck 9
  s4. <gf bf ef f>4  s4. <bf ef f af>4  s4. <cf ef gf>4 |
  s4. <a ef'>8 ef'\noBeam  ef4 <af, ef'>8 <g ef'>4
    s4 <gf af ef'>8 <f af d>4 |
  s4. <gf bf ef f>4  s4. <bf ef f af>4  s4. <cf ef gf>4 |
  s4. <a ef'>8 ef'\noBeam  ef4 <af, ef'>8 <g ef'>4
    s4 <gf af ef'>8 <f af d>4 |
  s4. <af d f>4  s4. <d af' bf>4  s4. <cf ef gf cf>4 |
  s4. <g bf ff' g>4  s4. <g df' ef g>4  s4. <ff af cf ff>4 |
}

leftHandLower = \relative {
  \partial 8 <bf,, bf'>8 
  <ef ef'>4.-> r8 <bf bf'>  <ef ef'>4.-> r8 <ef ef'>  
    <gf gf'>4.-> r8 <gf gf'> |
  <cf cf'>4.->~ q4~  q4.~ q8 q q4.~ q8 <bf, bf'> |
  <ef ef'>4.-> r8 <bf bf'>  <ef ef'>4.-> r8 <ef ef'>  
    <gf gf'>4.-> r8 <gf gf'> |
  <cf cf'>4.->~ q4~  q4.~ q8 q q4.~ q8 <bf bf'> |
  <af af'>4. r8 q  <gf gf'>4. r8 <f f'>  <ef ef'>4. r8 <ef' ef'> |
  <df df'>4. r8 q  <cf cf'>4. r8 <bf bf'>  <af af'>4. r8 <af, af'> |
  <a a'>4. <bf bf'>8 <ef ef'>  <f f'>4.~ q8 <gf gf'>  <bf bf'>4. r8 <bf, bf'> |
  <gf' gf'>4.~ q8 <f f'>  <gf gf'>4.~ q8 <f f'>  <bf bf'>4.~ q8 <bf, bf'> |
  
  \barNumberCheck 9
  \voiceFour <ef ef'>4.-> r8 <bf bf'>  <ef ef'>4.-> r8 q  <gf gf'>4.-> r8 q |
  <cf cf'>4.~ q4~ \moveTieA q4.~ \moveTieB q8 q q4.~ \moveTieC q8 <bf, bf'> |
  <ef ef'>4.-> r8 <bf bf'>  <ef ef'>4.-> r8 q  <gf gf'>4.-> r8 q |
  <cf cf'>4.~ q4~ \moveTieA q4.~ \moveTieB q8 q q4.~ \moveTieC q8 <bf bf'> |
  <af af'>4. r8 q  <gf gf'>4. r8 <f f'>  <ef ef'>4. r8 q |
  <df df'>4. r8 q  <cf cf'>4. r8 <bf bf'>  <af af'>4. r8 q |
  \oneVoice <a a'>4. <bf bf'>8 <ef ef'>  <f! f'>4.~ q8 <gf! gf'>  
    <bf bf'>4. r8 <af, af'> |
  <a a'>4. <bf bf'>8 <ef ef'>  <f f'>4.~ q8 <gf gf'>  <bf bf'>4. r8 <bf, bf'> |
  
  \barNumberCheck 17
  <gf' gf'>4.~ q8 <f f'>  <gf gf'>4.~ q8 <f f'>  <ff ff'>4.~ q8 <f f'> |
  <gf gf'>4.~ q8 <f f'>  <gf gf'>4.~ q8 <f f'>  <ff ff'>4.~ q8 <f f'> |
  <ef ef'>4.~ q8 <af, af'>  <cf' cf'>4.~ q8 q  q4.~ q8 <ef ef'> |
  <ef ef'>4.~ q8 <af, af'>  \clef treble <cf' cf'>4.~ q8 q  
    q4. r8 \clef bass <bf,, bf'> |
  <ef, ef'>4.~ q8 <bf'' bf'>  <gf' gf'>4. r8 <bf, bf'>  q4. r8 <bf, bf'> |
  <ef, ef'>4. r8 <bf'' bf'>  q4. r8 <bf, bf'>  q4. r8 <ef, ef'> |
  q4. r8 q  q4. r8 q  <ef bf' ef>[-> q-> q-> q-> q]-> |
  q1->\fermata 
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
  \partial 8 s8
  s4.\mf s4  s8 s4\< s  s4. s8\! s |
  s4. s4  s4. s4\>  s4. s4\! |
  s1 * 15/8 |
  s4. s4  s4. s4\> s4 s8\! s4 |
  s4. s8 s\cresc  s4. s4  s4. s4 |
  s4. s4  s8 s4\cresc s  s4. s4 |
  s1 * 15/8\ff |
  s4. s4  s4.\dim s4  s4. s4 |
  
  \barNumberCheck 9
  s4.\f s4  s4. s4  s8 s\< s s4\! |
  s4.\sf s8 s\sf  s4.\sf s4\>  s4. s4\! |
  s4. s4  s4. s4\<  s4. s4\! |
  s4. s8 s\sf  s4.\sf s4\>  s8 s\! s s4 |
  s4. s4  s4.\cresc s4  s4. s4 |
  s4. s8 s\cresc  s4. s4  s4. s4 |
  s1 * 15/8\ff |
  s8 s4\dim s  s4. s4  s4. s4 |
  
  \barNumberCheck 17
  s8\p s4\< s  s4. s8 s\!  s4.\f\> s4\! | 
  s4.\mf\< s4  s4. s8 s\!  s4.\ff\> s4\! |
  s4.\f s4  s s8\cresc s4  s4. s4 |
  s1 * 15/8 |
  s1 * 15/8-\tweak X-offset 0 \fff |
}

forceBreaks = {
  \partial 8 s8 
  s1 * 15/8 | s1 * 15/8 \break
  s1 * 15/8 * 2 | s1 * 15/8 \break
  s1 * 15/8 * 2 | s1 * 15/8 \break
  s1 * 15/8 | s1 * 15/8 \break
  s1 * 15/8 | s1 * 15/8 \pageBreak
  
  s1 * 15/8 | s1 * 15/8 \break
  s1 * 15/8 * 2 | s1 * 15/8 \break
  s1 * 15/8 | s1 * 15/8 \break
  s1 * 15/8 | s1 * 15/8 \break
}

preludeFourteenNotes =
\score {
  \header {
    title = "14."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 14"
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

preludeFourteenMidi =
\book {
  \bookOutputName "prelude-op11-no14"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics >>
      \new Staff = "lower" << \leftHand \dynamics >>
    >>
    \midi {}
  }
}
