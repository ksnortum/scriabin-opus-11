%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

global = {
  \time 3/4
  \numericTimeSignature
  \key g \major
  \accidentalStyle piano
  % Group eight-notes in twos
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
}

rightHandUpper = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \textMark \markup \tempo-markup Vivo #2 #0 184-192-200
  \voiceOne
  \tuplet 3/2 { d'8( a c  g' c, d } a'16 b a e |
  \oneVoice
  \tuplet 3/2 { 
    % third d, with tenuto, SrcB
    d'8-- g, a  d-- fs, g  d'-- e, fs | 
    b8 d, e  a e fs  g e d |
    fs8 a, b  g' b, c  e fs e) |
    \voiceOne
    d8( a c  g' c, d } a'16 b a e |
  \oneVoice
  \tuplet 3/2 {
    d'8-- g, a  d-- fs, g  d'-- e, fs | 
    b8 d, e  a e fs  g e d |
    fs8 b, cs  g' b, cs  e b cs) |
    
    \barNumberCheck 9
    \voiceOne
    fs8( b, cs  es cs d  es as b |
    \oneVoice
    % a natural in third beat, SrcA.
    % ScrB seems to have the natural on the wrong note.
    d8 cs b  as cs b  es, a g) |
    \voiceOne
    fs8( b, cs  es cs d  es as b |
    \oneVoice
    d8 cs b  as cs b  e, a as |
    d8 cs e,  es g fs  d fs as |
    cs8 b d,  es g fs  c d g |
    b8 a c,  d g fs  a e fs |
    g8 d e  fs c d  e b c) |
    
    \barNumberCheck 17
    \voiceOne
    d8( a c  g' c, d } a'16 b a e |
  \tuplet 3/2 {
    d'8 g, a  d fs, g  d' e, fs |
    \oneVoice
    b8 d, e  a e fs  g e d |
    fs8 a, b  g' b, c  d e d) |
    \voiceOne
    g8( d f  c' f, g } \oneVoice d'16 e d a |
  \voiceOne  
  g'4 g g |
  \oneVoice
  \tuplet 3/2 {
    e8 g, a  d a b  c a g |
    b8 e, fs  c' e, fs  a e fs |
    
    \barNumberCheck 25
    b8 e, fs  as fs g  as ds e |
    g8 fs e  ds fs e  as, d c |
    b8 e, fs  as fs g  as ds e |
    g8 fs e  ds fs e  a, d ds |
    g8 fs a,  as c b  g b ds |
    fs8 e g,  as c b  f as b |
    % a sharp, second beat, SrcA
    e8 d f,  as c b  e,^\accel a b |
    d8 c e,  gs b a  ef^\accel a b |
    
    \barNumberCheck 33
    d8 c ef,  b' d c  d, g a |
    c8 b d,  a' c b  c, g' a |
    c8 b c,  g' b a  g a c |
    g'8 d c  ef a, g  d ef c) |
    \voiceOne
    d8( a c  g' c, d } a'16 b a e |
  \tuplet 3/2 {
    d'8^\accel g, a  d fs, g  d' e, fs |
    b8 d, e  a e fs  g e d |
    \oneVoice
    fs8 a, b  g' b, c  e fs e) |
    
    \barNumberCheck 41
    d8( a c  g' c, d } a'16 b a e |
  d'2.~ |
  d2.~ |
  \voiceOne
  d2.~ |
  d2.~ |
  d2.)\fermata |
  \bar "|."
}

rightHandLower = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \voiceTwo
  d'4 g s |
  s2. * 3 |
  d4 g s |
  s2. * 3 |
  
  \barNumberCheck 9
  fs4 es s |
  s2. |
  fs4 es s |
  s2. * 5 |
  
  \barNumberCheck 17
  d4 g s |
  d'4 d d |
  s2. * 2 |
  g,4 c s |
  \tuplet 3/2 { g'8 c, d  g b, c  g' a, b } |
  s2. * 2 |
  
  \barNumberCheck 25
  s2. * 8 |
  
  \barNumberCheck 33
  s2. * 4 |
  d,4 g s |
  d'4-- d-- d-- |
  b4 s2 |
  s2. |
  
  \barNumberCheck 41
  s2. * 3 |
  <c, d g a>4 r r |
  <d g b>2.~ |
  q |
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
  \omit TupletBracket
  \omit TupletNumber
  \clef bass
  d8( g, d' c' \tuplet 3/2 { d c g) } |
  R2. |
  d8( g, d' a' b g) |
  d8( g, d' a' b d,) |
  d8( g, d' c' \tuplet 3/2 { d c g) } |
  R2. |
  d8( g, d' a' b g) |
  cs,8( e, cs' g' b4) |
  
  \barNumberCheck 9
  d,8( fs, d' g b g |
  es'4) r r |
  d,8( fs, d' g b g |
  es'4) r fs,8( fs, |
  as'8 e cs'4) fs,8( b, |
  b'8 d, d'4) d,8( d, |
  c''8 d, b' a c4) |
  R2. |
  
  \barNumberCheck 17
  d,8( g, d' c' \tuplet 3/2 { d c g) } |
  R2. |
  d8( g, d' a' b g) |
  d8( g, d' a' b d,) |
  d8( g, d' c' \tuplet 3/2 { g' f c) } |
  R2. |
  g8( c, g' d' e c) |
  fs,8( a, fs' c' e4) |
  
  \barNumberCheck 25
  g,8( b, g' c e c |
  as'4) r r |
  g,8( b, g' c e c |
  as'4) r b,8( b, |
  ds'8 a fs'4) b,8( e, |
  e'8 g, g'4) d,8( gs, |
  b'8 f d'4) e,8( a, |
  a'8 e c'4) g8( c, |
  
  \barNumberCheck 33
  ef'8 a, g'4) g,8( d |
  d'8 g, g'4) g,8( ef |
  g'8 g, c4) g8( c, |
  ef'4) r r |
  d,8( g, d' c' \tuplet 3/2 { d c g) } |
  R2. |
  d8( g, d' a' b g) |
  d8( g, d' a' b d,) |
  
  \barNumberCheck 41
  d8( g, d' c' \tuplet 3/2 { d c g) } |
  R2. * 2 |
  <d a'>4 r r|
  <g, d' b'>2.~ |
  q |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s4\p s\< s8. s16\! |
  s2. * 3 |
  s4 s\< s8. s16\! |
  s2. * 3 |
  
  \barNumberCheck 9
  s2 \tuplet 3/2 { s4\< s8\! |
    s8 s4\> s s8\! s4. |
    s2. s4\< s8\! |
    s8 s4\> s s8\! s4\< s8\! |
    s4\> s8\! s4. s4\< s8\! |
    s4.\> s4 s8\! s4\< s8\! |
    s2. s4. |
    s2.\> s4 s8\! |
  } 
  
  \barNumberCheck 17
  s4 s\< s8. s16\! |
  s2. * 3 |
  s2.\cresc |
  s2. * 3 |
  
  \barNumberCheck 25
  \tuplet 3/2 { 
    s2. s4\< s8\! |
    s2. s4. |
    s2. s4\< s8\! |
    s8 s4\> s4 s8\! s4\< s8\! |
    s4.\> s\! s4\< s8\! |
    s4.\> s4 s8\! s4. |
    s4\> s8\! s4. s4\< s8\! |
    s4\> s8\! s4. s4\< s8\! |
    
    \barNumberCheck 33
    s4\> s8\! s2. |
    s2. s4. |
    s2. s4\< s8\! |
    s4\> s8\! s2. |
    s4. s4.\< } s8. s16\! 
  r2.
  s2.\p |
}

% MIDI only
pedal = {
  s2.\sd |
  s2.\su |
  s2.\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su |
  s2.\sd |
  s2.\su\sd |
  
  \barNumberCheck 9
  s2\su\sd s4\su\sd |
  s4\su\sd s2\su |
  s2\sd s4\su\sd
  s4\su\sd s\su s\sd
  s2 s4\su\sd |
  s2 s4\su\sd |
  s2. |
  s2.\su |
  
  \barNumberCheck 17
  s2.\sd |
  s2.\su |
  s2.\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2.\su |
  s2.\sd |
  s2.\su\sd |
  
  \barNumberCheck 25
  s2\su\sd s4\su\sd |
  s4\su\sd s2\su |
  s2\sd s4\su\sd |
  s4\su\sd s\su s\sd |
  s2 s4\su\sd |
  s2 s4\su\sd |
  s2 s4\su\sd |
  s2 s4\su\sd |
  
  \barNumberCheck 33
  s2 s4\su\sd |
  s2 s4\su\sd |
  s2 s4\su\sd |
  s4 s2\su |
  s2.\sd |
  s2.\su |
  s2.\sd |
  s2.\su\sd |
  
  \barNumberCheck 41
  s2.\su\sd |
  s2.\su |
  s2. * 2 |
  s2.\sd |
}

preludeThreeNotes =
\score {
  \header {
    title = "3."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 3"
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

preludeThreeMidi =
\book {
  \bookOutputName "prelude-op11-no03"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {
      \tempo 4 = 184
    }
  }
}
