%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0.25))
                        ) \etc

%%% Music %%%

global = {
  \time 6/4
  \numericTimeSignature
  \key e \minor
  \accidentalStyle piano
  % Group eight-notes in twos
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1,1,1,1
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup Lento #2 #0 72-80
  \voiceOne
  s2. b''2.--~ |
  b4 g fs s d-.( cs-. |
  b4-.) r r fs'2.--~ |
  fs4 d cs s a-.( gs-. |
  g4-.) r e( g2 fs4 |
  fs2) fs4( a2 g4 |
  \oneVoice
  <b, d g>4 <d g cs> <d g b> <cs fs as> <e as d> <e as cs> |
  <e a c>4 <ds a' b> <a' ds> <a ds g> <a ds fs> <a ds g> |
  
  \barNumberCheck 9
  <a e'>4) <b e> q \voiceOne b'2.--~ |
  b4 g fs s d-.( cs-. |
  b4-.) r r fs'2.--~ |
  fs4 d cs s a-.( gs-. |
  g4-.) r e( g2 fs4 |
  fs2) fs4( a2 g4) |
  s2 b4( d2 d4 |
  <d, d'>2. <c c'>2.*2/3 \hideNoteHead a4) |
  
  \barNumberCheck 17
  s2. <e' c'> |
  \oneVoice <e g b>2. r2 r4 | 
  \voiceOne
  <ds b'>2. b'2\rest b4\rest |
  <e, b'>2. <ds b'> |
  <e b'>2. <ds b'> |
  <e b'>2. b'2\rest b4\rest |
  <e, b'>2. b'2\rest b4\rest |
  \oneVoice R1. |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  b'4 b <b e> <b ds> q q |
  <b e>4 q <as e'> \oneVoice r \voiceTwo <e as> q |
  <e b'>4 <fs b> q <fs as> q q |
  <fs b>4 q <es b'> \oneVoice r \voiceTwo <b es> q |
  <b e>4 <g b> q <g e'> <b e> <b fs'> |
  <a c>4 q q <a fs'> <c fs> <c g'> |
  s1. * 2 |
  
  \barNumberCheck 9
  s2. <b' ds>4 q q |
  <b e> q <as e'> \oneVoice r \voiceTwo <e as> q |
  <e b'>4 <fs b> q <fs as> q q |
  <fs b> a <es b'> \oneVoice r \voiceTwo <b es> q |
  <b e>4 <g b> q\< <g e'>\! <b e> <b fs'> |
  <a c>4 q q <a fs'> <c fs> <c g'> |
  \oneVoice r4 r \voiceTwo <d f> <d b'> q q |
  % first tenuto, SrcB
  a'4-- a-- a-- a-- a-- a-- |
  
  \barNumberCheck 17
  \oneVoice r2 r4 \voiceTwo g g g |
  s1. |
  b,4 b b~ b2. |
  b4 b b b b b |
  b4 b b b b b |
  b4 b b~ b2. |
  b4 b b~ b2. |
  s1. |
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
  s1. * 4 |
  s2. b4 r r |
  s2. c4 r c\rest |
  s1. * 2 |
  
  \barNumberCheck 9
  s1. * 4 |
  s2. b4 r r |
  s2. c4 r c\rest |
  s2. f |
}

leftHandLower = \relative {
  \omit TupletBracket
  \bassToTreble
  r4 r8 a'--( gs-- g-- g2 g4--~ |
  g8 fs e d \tuplet 3/2 { d cs8. fs,16 } fs'2.~ |
  fs4) r8 \clef bass e---\slurShapeA ( ds-- d-- d2 d4--~ |
  d8 cs b a \tuplet 3/2 { a gs8. cs,16 } cs'2.~ |
  cs4.) e,8_( d cs~ \voiceFour cs2 d4) |
  ds4. fs8( e ds~ ds2 e4) |
  \oneVoice
  es2. fs |
  b2. b~ |
  
  \barNumberCheck 9
  b4. \clef treble a'8--( gs-- g-- g2 g4--~ |
  g8 fs e d \tuplet 3/2 { d cs8. fs,16 } fs'2.~ |
  fs4) r8 \clef bass e--( ds-- d-- d2 d4--~ |
  d8 cs b a \tuplet 3/2 { a gs8. cs,16 } cs'2.~ |
  cs4) r8 e,8_( d cs~ \voiceFour cs2 d4 |
  ds4.) fs8( e ds~ ds2 e4) |
  \oneVoice r4 r8 \voiceFour b'( a gs~ gs2. |
  \oneVoice
  <a f'>2.~ q) |
  
  \barNumberCheck 17
  r2 r4 as2. |
  b4 b b~ b2. |
  <b, a'>2. r2 r4 |
  % tenuto on fourth beat, g, SrcB
  <e, b' g'>4. a'8_(\< gs g\! g2-- b,4~ |
  <e, b' g'>4.) a'8_(\< gs g\! g2-- b,4~ |
  <e, b' g'>2.) r2 r4 |
  <e b' g'>2. r2 r4 |
  e,4 r r r2 r4 |
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
  s2\> s4\! s s2\pp |
  s1. * 2 |
  s4. s4-\tweak extra-offset #'(-0.5 . 0) \cresc s8\< s4\! s2 |
  s2 s4\< s\! s2 |
  s2. s2\< s4\! |
  s1\mf\> s4 s\! |
  
  \barNumberCheck 9
  s4 s\p s1 |
  s2\> s4\! s4 s2\pp |
  s1. |
  s2\> s4\! s2. |
  % s2 s4\< s\! s2 |
  s1. |
  s2 s4\< s\! s2 |
  s2 s1\pp |
  s4 s2\> s s4\! |
  
  \barNumberCheck 17
  s2. s\pp |
  s1. * 2 |
  s2 s4\< s\! s\> s\! |
  s2 s4\< s\! s\> s\! |
  s2. s\ppp |
  s1. * 2 |
}

preludeFourNotes =
\score {
  \header {
    title = "4."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 4"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
  >>
  \layout {}
}

\include "articulate.ly"

preludeFourMidi =
\book {
  \bookOutputName "prelude-op11-no04"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics >>
      \new Staff = "lower" << \leftHand \dynamics >>
    >>
    \midi {
      \tempo 4 = 76
    }
  }
}
