%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

forceHShiftA = \tweak NoteColumn.force-hshift -0.5 \etc

%% Music %%%

global = {
  \time 2/4
  \key f \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \partial 4 r8 <c' af' c>
  r8 <df af' df> r <c af' c> |
  r8 <df af' df> r <e bf' e> |
  r8 <f bf f'>\< r <g df' g> |
  r8 <c g' c>\! r <c gf' c> |
  r8 <c f c'> r <b f' b> |
  r8 <bf f' bf> r <a f' a> |
  r8 <af df f af> r <af c f af> |
  r8 <g b f' g> r <c, c'>^( |
  
  \barNumberCheck 9
  <ef ef'>8 <df df'>) r <c c'>^( |
  <ef ef'>8 <df df'>) r <e e'>( |
  q8 <f f'> q <g g'> |
  q8 <c c'> <df df'>^\rubato <c c'>) |
  q8( <b b'> q <bf bf'> |
  q8 <a a'> q <af af'> |
  q8 <g g'> <af af'> <g g'> |
  \tuplet 3/2 { q4 <f f'>8) } \scaleDurations 2/3 { <f, f'>8^( q q |
    
    \barNumberCheck 17
    q8 <gf gf'> <g g'> <af af'> <bf bf'> <c c'> |
    <df df'>4 \hideNoteHead g8)
  } \voiceOne r( <df df'> |
  r8 <c c'>) r( <g g'> |
  r8 <af af'>) \scaleDurations 2/3 { q( q q |
    q8 <bff bff'> <bf bf'> <cf cf'> <df df'> <ef ef'> |
    <ff ff'>4 \hideNoteHead bf8)
  } r( <ff ff'> |
  r8 <ef ef'>) r( <bf bf'> |
  r8 <cf cf'>) r( <gf'_~ gf'^~> |
  
  \barNumberCheck 25
  q8 <f f'>) r( <c_~ c'^~> |
  q8 <df df'>) r( <af' af'> |
  r8 q) r( <a a'> |
  r8 q) r( <bf bf'> |
  r8 q4 <b b'>8 |
  \oneVoice <c e c'>4) r8 <c, c'>^( |
  <ef ef'>8 <df df'>) r <c c'>^( |
  <ef ef'>8 <df df'>) r <e e'>( |
  
  \barNumberCheck 33
  q8 <f f'> q <g g'> |
  q8 <c c'>) \scaleDurations 2/3 { <df df'>-> <c c'>-> q-> |
    q8^\accel <b b'> q q <bf bf'> q |
    q8^\accel <a a'> q q <af af'> q |
    \repeat unfold 4 { <af af'>8 <g g'>q <af af'> <g g'>q | }
  }
  
  \barNumberCheck 41
  <f f'>4 \scaleDurations 2/3 { <f, f'>8^( q q |
    q8 <gf gf'> <g g'> <af af'> <bf bf'> <c c'> |
  }
  <df df'>4) \clef bass <c, e c'> |
  <c f c'>4 <c bf' c> |
  <c af' c>4 \scaleDurations 2/3 { \clef treble <f f'>8^( q q |
    q8 <gf gf'> <g g'> <af af'> <bf bf'> <c c'> |
  } 
  <df df'>4) \clef bass <c, e c'>4 |
  <c f c'>4 <c bf' c> |
  <c af' c>4 \scaleDurations 2/3 { \clef treble <g' g'>8 <f f'> q |
    <g' g'>8 <f f'> q <g' g'> <f f'> q |
    \ottava 1 <g' g'>8 <f f'> q \ottava 0
  } r4
  R2 |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo 
  \partial 4 s4
  s2 * 7 |
  s4. \forceHShiftA af'8 |
  
  \barNumberCheck 9
  af4 s8 \forceHShiftA af |
  af4 s8 \forceHShiftA bf |
  \voiceOne bf4 df |
  c4 gf' |
  f4 f |
  f4 f |
  <df f>4 <c e> |
  c4 s |
  
  \barNumberCheck 17
  s4 \voiceTwo f, |
  \tuplet 3/2 { af4 g8 } gf g |
  af4 ef8 df |
  c4 s |
  s4 af' |
  \tuplet 3/2 { cf4 bf8 } bff bf |
  cf4 gf8 ff |
  ef4 cf'8 c |
  
  \barNumberCheck 25
  df4 af8 gf |
  f4 df'8 d |
  ef4 d8 ds |
  e4 ef8 e |
  f4 f |
  s4. \forceHShiftA af,8 |  
  af4 s8 \forceHShiftA af |
  af4 s8 \forceHShiftA bf |
  
  \barNumberCheck 33
  \voiceOne bf4 df |
  c4 gf' |
  f4 f |
  f4 f |
  f4-> f-> |
  f4-> f-> |
  f4-> f-> |
  f4-> e-> |
  
  \barNumberCheck 41
  s2 |
  s4 \voiceTwo f, |
  f4 s4 |
  s2 * 2 |
  s4 f |
  f4 s |
  s2 |
  s4 c |
  \voiceOne c'4 c' |
  c' s4 |
  s2 |
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
  \partial 4 \tuplet 3/2 { <e, e'>8 q q }
  \scaleDurations 2/3 {
    <f f'>8-> <bf bf'> <f f'> <e e'> q q |
    <f f'>8-> <bf bf'> <f f'> <g g'> q q |
    <df' df'>8\> <bf bf'> <af af'>\! <bf bf'>\> <g g'> <f f'>\! |
    <bf  bf'>8\> <f f'> <e e'>\! <ef ef'> q q |
    <d d'>8 <af' af'> <d, d'> <df df'> q q |
    <c c'>8 <f f'> <c c'> q q q |
    <b b'>8 <f' f'> <b, b'> <c c'> <f f'> <c c'> |
    <d d'>8 <g g'> <d d'> <e e'> q q |
    
    \barNumberCheck 9
    <f f'>8 <bf bf'> <f f'> <e e'> q q |
    <f f'>8 <bf bf'> <f f'> <g g'> q q |
    <df' df'>8\> <bf bf'> <af af'>\! <bf bf'>\> <g g'> <f f'>\! |
    <bf  bf'>8\> <f f'> <e e'>\! <ef ef'> q q |
    <d d'>8 <af' af'> <d, d'> <df df'> q q |
    <c c'>8 <f f'> <c c'> q q q |
    % first beat, third triplet, lower b-natural, SrcB
    <b b'>8 <df' df'> <b, b'> <c c'> <c' c'> <c, c'> |
    <f, f'>8 <c'' c'> r
  } r8 <ef, ef'>~( |
  
  \barNumberCheck 17
  q8 <df df'>4 <c c'>8~ |
  q8 <bf bf'>) \scaleDurations 2/3 { <ef ef'>8\< q q\! |
    <ff ff'>8\> <ef ef'> q\! r q\< q\! |
    <ff ff'>8\> <ef ef'> q\!
  } r <gf gf'>~ |
  q8 <ff ff'>4 <ef ef'>8~ |
  q8 <df df'> \scaleDurations 2/3 { r <gf gf'> q |
    <aff aff'>8 <gf gf'> q r q q |
    <aff aff'>8 <gf gf'> q r <af af'> q |
    
    \barNumberCheck 25
    <bff bff'>8 <af af'> q r q q |
    <bff bff'>8 <af af'> q r <bf bf'> q |
    <cf cf'>8 q q <b b'> q q |
    <c c'>8 q q q q q |
    <df df'>8 q q q q q |
  }
  <c c'>4 \scaleDurations 2/3 { <e, e'>8 q q |
    <f f'>8 <bf bf'> <f f'> <e e'> q q |
    <f f'>8 <bf bf'> <f f'> <g g'> q q |
    
    \barNumberCheck 33
    <df' df'>8\> <bf bf'> <af af'>\! <bf bf'>\> <g g'> <f f'>\! |
    <bf  bf'>8\> <f f'> <e e'>\! <ef ef'>-> q-> q-> |
    <d d'>8 <af' af'> <d, d'> <df df'> q q |
    <c c'>8 <f f'> <c c'> q q q |
  }
  <b b'>8-> <f'' f'> <c, c'>-> <f' f'> |
  <df, df'>8-> <f' f'> <c, c'>-> <f' f'> | 
  <b,, b'>8-> <f'' f'> <c, c'>-> <f' f'> |
  <df, df'>8-> <b' b'> <c c'> <c, c'>-> |
  
  \barNumberCheck 41
  <f f'>4-> r8 <ef ef'>->~ |
  q8 <df df'>4-> <c c'>8->~ |
  \tuplet 3/2 { q4 <bf bf'>8 } \scaleDurations 2/3 { r q q |
     q8\> <af af'> q\! r <g g'> q |
     q8\> <f f'> q\!
  } r8 <ef' ef'>->~ |
  q8 <df df'>4-> <c c'>8--~ |
  \tuplet 3/2 { q4\> <bf bf'>8\! } \scaleDurations 2/3 { r8 q q  |
    q8\> <af af'> q\! r <g g'> q |
    q8 <f f'> q 
    <<
      { 
        <g g'>8 <f f'> q | 
        <g g'>8 <f f'> q <g g'>8 <f f'> q | 
        <g g'>8 <f f'> q 
      }
      \\
      { c'4 * 3/2 | c c | c }
    >> 
  } r4 |
  R2 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 4 \scaleDurations 2/3 { s8\< s s\!
    s8\> s s\! s\< s s\! |
    s8\> s s\! s4. |
    s2. * 2 |
    s4. s\dim |
    s2. * 2 
    s4. s8 s\< s\! |
    
    \barNumberCheck 9
    s8\> s s\! s\< s s\! |
    s8\> s s\! s4. |
    s8 s\cresc s s4. |
    s4. s\ff |
    s4. s8 s\dim s |
    s2. * 2 |
    s4. s\p |
    
    \barNumberCheck 17
    s4 s8\< s4 s8\! |
    s8\> s s\! s4. |
    s2. * 2 |
    s4.\< s4 s8\! |
    s4.\f s\p |
    s2. * 2 |
    
    \barNumberCheck 25
    s2. |
    s2.\cresc |
    s2. |
    s8 s4\cresc s4. |
    s2. |
    s4. s8\ff\< s s\! |
    s8\> s s\! s\< s s\! |
    s8\> s s\! s4. |
    
    \barNumberCheck 33
    s2. * 8 |
    
    \barNumberCheck 41
    s4. s\p\< |
    s4. s4 s8\! |
    s4.\sf s\p |
    s2. * 3 |
    s4. s\p |
    s4. s\cresc |
    s4. s\fff |
    s4 s8\cresc  s4. |
    s4. s\! |
    s2. |
  }
}

tempi = {
  \textMark \markup \tempo-markup "Allegro agitato" #2 #0 138
  \set Score.tempoHideNote = ##t
  \tempo 4 = 120
  \partial 4 s4
  s2 * 8 |
  
  \barNumberCheck 9
  s2 * 8 |
  
  \barNumberCheck 17
  s2 * 8 |
  
  \barNumberCheck 25
  s2 * 8 |
  
  \barNumberCheck 33
  s2 * 2 |
  \tempo 4 = 132 s2 |
  \tempo 4 = 144 s2 |
  \tempo 4 = 152 s2 |
  \tempo 4 = 168 s2 |
  \tempo 4 = 176 s2 |
  \tempo 4 = 184 s2 |
  s4 \tempo "Presto" 4 = 192 s |
}

forceBreaks = {
  \partial 4 s4
  s2 * 4 s2 \break
  s2 * 4 s2 \break
  s2 * 4 s2 \break
  s2 * 4 s2 \break
  s2 * 4 s2 \pageBreak
  
  s2 * 4 s2 \break
  s2 * 4 s2 \break
  s2 * 4 s2 \break
  s2 * 5 s2 \break
}

preludeEighteenNotes =
\score {
  \header {
    title = "18."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 18"
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

preludeEighteenMidi =
\book {
  \bookOutputName "prelude-op11-no18"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \tempi >>
    >>
    \midi {}
  }
}
