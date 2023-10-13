%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Posistions and shapes %%%

beamBrokenA = \once \alterBroken positions #'((-7 . -4) (-2 . 0)) Beam
beamBrokenB = \once \alterBroken positions #'((-8 . -5) (-3 . 0)) Beam
beamBrokenC = \once \alterBroken positions #'((-7 . -4) (-3 . -1)) Beam
beamBrokenD = \once \alterBroken positions #'((-3.5 . -3.5) (-4 . -4)) Beam
beamBrokenE = \once \alterBroken positions #'((0 . 2) (3 . 6)) Beam
beamBrokenF = \once \alterBroken positions #'((-1.5 . -1.5) (-2.5 . -2.5)) Beam

slurShapeA = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 2)) \etc
slurShapeB = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 2)) \etc
slurShapeC = \shape #'((0 . 0) (0 . -2) (0 . 0) (0 . 3)) \etc
slurShapeD = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 1)) \etc
slurShapeE = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 1)) \etc
slurShapeF = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 2)) \etc
slurShapeG = \shape #'((0 . 3.5) (0 . 3.75) (0 . 3.75) (0 . 4.5)) \etc
slurShapeH = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 1) (0 . 0) (0 . 0) (0 . 0))
                        ) \etc
slurShapeI = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . -1.25) (0 . -0.5) (0 . 0) (0 . 0))
                        ) \etc
slurShapeJ = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (2 . 0) (0.5 . 0) (0.25 . 3))
                        ) \etc

%%% Music %%%

global = {
  \time 2/2
  \numericTimeSignature
  \key c \major
  \accidentalStyle piano
  \omit TupletBracket
  \omit TupletNumber
}

rightHand = \relative {
  \global
  \partial 2*2/5 \tuplet 5/4 { d''8--[( a
    c8-- g d]  d'[ e\< a\> g\! e]  d--[ a |
    c8-- g d]  d'--[ a c-- g c,])  g''--[( d |
    f8-- c g]  g'[ a\< d\> c\! a]  g--[ d |
    f8-- c g]  g'--[ d f-- c f,])  f'[( c |
    e8 c f,]  d'[ e a g f])  e[( c |
    d8 c f,]  c'[ d g f e])  d[( c |
    e8 c f,]  f'--[ c e'--^\rubato d-- c--]  a[ f |
    e8 b g]  d'[ b g' d g,])  a'8[( e |
    
    \barNumberCheck 9
    g8 d g,]  a'[ b e d c]  a[ e |
    g8 d g,]  e'[ g, c g c,])  f'[( b, |
    e8 b e,]  b''[ c e d c]  b[ e, |
    a8 e b]  b'[ e, a e a,])  g'[( b, |
    fs'8 a, c]  es[ fs a g b,])  \beamBrokenD f'[( a, |
    e'8 g, bf]  ds[ e g f a,])  e'[ \slurShapeH ( af, |
    d8 af d,]  e'[ g, d' g, d]  e'[ fs, |
    d'8 fs, d]  e'[ fs, d' fs, d]  e'[ g, |
    
    \barNumberCheck 17
    d'8 g, d]  e'[ g, d' g, d]  <a' a'>[ d |
    <g, g'>8 d' g,]  <a a'>[ d <g, g'> d' g,])  <d' d'>[( a' |
    <c, c'>8 g' d]  \ottavaInsideSlur \ottava 1 d'[ e a g e]
      \ottava 0 \beamBrokenF <d, d'>[ a' |
    <c, c'>8 g' d]  <d d'>[ a' <c, c'> g' c,])  <d, d'>8[( a' |
    <c, c'>8 g' d]  d'[ e a g e]  <d, d'>8[ a' |
    <c, c'>8 g' d]  <d d'>[ a' <c, c'> g' c,])  \clef bass d[(^\accel a |
    c8 g d]  d'[ a c g c,]  d'[ a |
    c8 g c,]  d'[ a c g c,]) r r |
  }
  r4 \clef treble <c'' e g c> r2 |
  \bar "|."
}

leftHand = \relative {
  \global
  \clef bass
  \partial 2*2/5 \tuplet 5/4 { c,8[( g'
  f'8 g f']) } r4 r \tuplet 5/4 { c,,8[( g' |
  f'8 g f'])  c,,[( g' e' g e'])  \beamBrokenA c,,[ \slurShapeA ( c' |
  bf'8 c bf']) } r4 r \tuplet 5/4 { c,,,8[( c' |
  bf'8 c bf'])  f,,[( c' a' c a'])  d,,,[( d' |
  a'8 d a']) } r4 r \tuplet 5/4 { \beamBrokenB a,,,8[ \slurShapeB ( a' |
  f'8 d' a']) } r4 r \tuplet 5/4 { d,,,,8[( d' |
  a'8 f' c']) } r4 r \tuplet 5/4 { g,,8[ \slurShapeC ( g' |
  f'8 b f'] } \tuplet 3/2 { b,4 f g,) } \tuplet 5/4 { c,8[ \slurShapeD ( g' |
                                                      
  \barNumberCheck 9
  f'8 g f']) } r4 r \tuplet 5/4 { c,,8[( g' |
  f'8 g f'])  c,,[( g' e' g e']) a,,[( e' |
  b'8 d gs]) } r4 r \tuplet 5/4 { a,,8[ \slurShapeE ( e'
    d'8 \clef treble e d'])  \clef bass a,,[( e' \clef treble c' e c'])
      \clef bass ds,,,[( ds' |
    c'8 fs a,])  e,[( e' b' e g,])  \beamBrokenC cs,,[ \slurShapeF ( cs' |
    bf'8 e g,])  d,[( d' a' d f,])  f,,[( f' |
    d'8 af' c])  g,,[( g' d' g c])  af,,[( af' |
    d8 fs c'])  a,,[( a' d fs c'])  \beamBrokenE g,,[ \slurShapeI ( g' |
    
    \barNumberCheck 17
    d'8 g c])  g,,[( g' d' g c])  g,,[( g' |
    f'8 b d])  g,,,[( g' f' b d])  <c,,, c'>4( |
    <g'' f' g>4*3/4 <g' f' g>)  \clef treble d''8[( e a g e])
      \clef bass <c,,,, c'>4 \slurShapeG ( |
    <g'' f' g>4*3/4 <g' f' g>)  <c,,, c'>4( <g'' e' g>4*3/4 <g' e' g>)  
      <c,,, c'>4( |
    <f'' g>4*3/4 g,)  d''8[ e a g e]  <c,,, c'>4( |
    <f'' g>4*3/4 g,)  <c,, c'>4( <e'' g>4*3/4 g,)  f'4-- \slurShapeJ ( |
    g,4*3/4 c,)  e'4--( g,4*3/4 c,)  e'4--( |
    g,4*3/4 c,)  e'4--( g,4*3/4 c,  <g g'>4)
  }
  <c, c'>4 <e'' g c e> r2 |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 2*2/5 \tuplet 5/4 { s4\p
    s1 s4 |
    s4.  s2 s8\cresc  s4 |
    s1 s4 |
    s4.  s2 s8\cresc  s4 |
    s1 s4 |
    s4.  s2 s8\cresc  s4 |
    s4.  s4 s4.\f  s4 |
    s4.  s4\dim s4.  s4\p |
    
    \barNumberCheck 9
    s1 s4 |
    s1 s4 |
    s4.  s4 s4.  s4\pp |
    s1 s4 |
    s4.  s4\cresc s4.  s4 |
  } 
  s1 * 3 |
  
  \barNumberCheck 17
  s1
  \tuplet 5/4 { s1 s4\ff } |
  s1 * 6 |
  s1\ff |
}

% MIDI only
pedal = {
  \partial 2*2/5 \tuplet 5/4 { s4\sd
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4.  s4\su\sd s4.  s4\su\sd |
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4.  s4\su\sd s4.  s4\su\sd |
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4. } \tuplet 3/2 { s2. } \tuplet 5/4 { s4\su\sd |
                              
  \barNumberCheck 9
  s4. } s2\su \tuplet 5/4 { s4\sd |
  s4.  s4\su\sd s4.  s4\su\sd |
  s4. } s2\su \tuplet 5/4 { s4\sd |
  \repeat unfold 5 { s4.  s4\su\sd s4.  s4\su\sd | }
  
  \barNumberCheck 17
  s4.  s4\su\sd s4.  s4\su\sd |
  s4.  s4\su\sd s4.  s4\su\sd |
  s4.  s4\su s4.  s4\sd |
  s4.  s4\su\sd s4.  s4\su\sd |
  s4.  s4\su s4.  s4\sd |
  s4.  s4\su\sd s4. s4\su\sd |
  s4.  s4\su\sd s4. s4 |
  s4.  s4 s4.  s4 } |
  s2 s\su |
}

forceBreaks = {
  \partial 2*2/5 s2*2/5
  s1 s1 \break
  s1 * 2 s1 \break
  s1 * 2 s1 \break
  s1 * 2 s1 \pageBreak
  
  s1 s1 \break
  s1 * 2 s1 \break
  s1 * 2 s1 \break
  s1 * 2 s1 \break
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo 4 = 100
  \textMark \markup \tempo-markup Vivace #2 #0 63-76
  \partial 2*2/5 s2*2/5
  s1 * 6 |
  \tuplet 5/4 { s4. s4 \tempo 4 = 92 s4. \tempo 4 = 100 s4 } |
  s1 |
  
  \barNumberCheck 9
  s1 * 3 |
  \tuplet 5/4 { 
    s4. s4 s4. \tempo 4 = 104 s4 |
    s4. \tempo 4 = 108 s4 s4. \tempo 4 = 112 s4 |
    s4. \tempo 4 = 116 s4 s4. \tempo 4 = 120 s4 |
    s4. \tempo 4 = 126 s4 s4. \tempo 4 = 132 s4 |
    s4. \tempo 4 = 138 s4 s4. \tempo 4 = 144 s4 |
  } 
  
  \barNumberCheck 17
  \tuplet 5/4 {
    s4. \tempo 4 = 152 s4 s4. \tempo 4 = 160 s4 |
  }
  s1 * 4 |
  \tuplet 5/4 {
    s4. s4 s4. \tempo 4 = 184 s4 |
    s4. \tempo 4 = 192 s4 s4. \tempo 4 = 200 s4 |
    s4. \tempo 4 = 208 s4 s4. s4
  }
}

preludeOneNotes =
\score {
  \header {
    title = "1."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 1"
  }
  \keepWithTag layout  
  \new PianoStaff \with { 
    \override StaffGrouper.staff-staff-spacing = 
      #'((basic-distance . 10)
         (padding . 2))
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \forceBreaks
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

preludeOneMidi =
\book {
  \bookOutputName "prelude-op11-no01"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
