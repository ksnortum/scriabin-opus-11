%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

moveClefA = \once \override Score.Clef.extra-offset =  #'(0.5 . 0)

%%% Music %%%

global = {
  \time 3/4
  \key f \major
  \accidentalStyle piano
}

rightHand = \relative { 
  \global
  \omit TupletBracket
  \omit TupletNumber
  \textMark \markup \tempo-markup Vivo #2 #0 152
  \set Score.tempoHideNote = ##t
  \tempo 4 = 120
  \tuplet 3/2 { 
    c'8( f \tuplet 3/2 { d'16 e d }  c8 f d  a' g d |
    c8 f d'  c f, d  a' c, f, |
    e8 c' a'  g g, a  e' a, b |
    d8 c g  bf f g  e f d) |
    c8( f \tuplet 3/2 { d'16 e d }  c8 f d  a' g d |
    c8 f d'  c f, d  a' c, ds, |
    e8 a f'  e e, f  c' f, gs |
    b8 a f  a e f  d e c) |
    
    \barNumberCheck 9
    r8 e( b'  c b c  d b a |
    ds8 a g  e' g, fs  a' fs, d') |
    r8 d,( a'  bf-\insideSlur \prall a bf  c a g |
    % last triplet, SrcA c; SrcB has cs
    cs8 g f  d' f, e  g' e, c') |
    c,8( f \tuplet 3/2 { d'16 e d }  c8 f d  a' g d |
    c8 f d'  c f, d  a' c, f, |
    e8 c' \tuplet 3/2 { a'16 bf a }  g8 c, g'  f e d |
    c8 e \tuplet 3/2 { a16 bf a }  g8 c, g'
  } f4) |
  
  \barNumberCheck 17
  \tuplet 3/2 { 
    r8 e,8( b'  c b c  d b a |
    % last triplet, SrcA d; SrcB has ds
    ds8 a g  e' g, fs  a' fs, d') |
    r8 d,( a'  bf-\insideSlur \prall a bf  c a g |
    % last triplet, SrcA c; SrcB has cs
    cs8 g f  d' f, e  g' e, c') |
    c,8( f \tuplet 3/2 { d'16 e d }  c8 f d  a' g d |
    c8 f d'  c f, d  a' c, f, |
    e8 c' \tuplet 3/2 { a'16 bf a }  g8 c, g'  f e d |
    c8 e \tuplet 3/2 { a16 bf a }  g8 c, g' 
  } f4) |
  
  \barNumberCheck 25
  \tuplet 3/2 { 
    c,8( e \tuplet 3/2 { bf'16 c bf }  a8 e a  g f d |
    c8 f c' 
  } f4) r |
  \bar "|."
}

leftHandUpper = \relative {
  \voiceThree 
  r4 f'2~ |
  f4 s2 |
  r4 e f |
  e4 s2 |
  r4 f2~ |
  f4 s2 |
  r4 c4 d |
  c4 s2 |
  
  \barNumberCheck 9
  s4 a' g |
  s2. |
  s4 g f |
  s2. |
  s4 f2~ |
  f4 s2 |
  s2. * 2 |
  
  \barNumberCheck 17
  s4 a g |
  s2. |
  s4 g f |
  s2. |
  s4 f2~ |
  f4 s2 |
  s2. * 2 |
  
  \barNumberCheck 25
}

leftHandLower = \relative {
  \voiceFour
  f,8. c'16 a'4 bf |
  a4 c, \oneVoice r |
  \voiceFour g g'2~ |
  g4 c,2 |
  f,8. c'16 a'4 bf |
  a4 c, \oneVoice r |
  \voiceFour e,4 e'2~ |
  e4 \oneVoice a, r |
  
  \barNumberCheck 9
  \tuplet 3/2 { a4 e'8 } c'2  |
  \oneVoice c'8[ c,] d,[ c'] fs4 |
  \tuplet 3/2 { g,,4 d'8 } bf'2 |
  bf'8[ bf,] c,[ bf'] e4 |
  \tuplet 3/2 { f,,4 c'8 } a'4 bf |
  a4 \voiceFour c, \oneVoice r4 |
  <a e' c'>4 <c bf' e> <d a' f'> |
  <a' e'>4 \clef treble <c bf'> <f a> |
  
  \barNumberCheck 17
  \clef bass \tuplet 3/2 { a,,4 e'8 } c'2 |
  c'8[ c,] d,[ c'] fs4 |
  \tuplet 3/2 { g,,4 d'8 } bf'2 |
  bf'8[ bf,] c,[ bf'] e4 |
  \tuplet 3/2 { f,,4 c'8 } a'4 bf |
  a4 \voiceFour c, \oneVoice r4 |
  <a e' c'>4 <c bf' e> <d a' f'> |
  <a' e'>4 \clef treble <c bf'> <d a'> |
  
  \barNumberCheck 25
  \moveClefA \clef bass <a, e' c'>2 <c bf'>4 |
  a'8 c, f,4 r |
}

leftHand = {
  \global
  \omit Staff.TupletNumber
  \omit Staff.TupletBracket
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \tuplet 3/2 { 
    s2.\p s4 s8\< |
    s2. s4 s8\! |
    s8 s4\> s2. |
    s2. s4 s8\! |
    s2. s4.\< |
    s2. s8 s4\! |
  }
  s2. * 2 |
  
  \barNumberCheck 9
  \tuplet 3/2 { 
    s4. s8 s4\< s8 s4\! |
    s8 s4\> s4. s4 s8\! |
    s4. s2.\< |
    s8\! s4\> s4. s4 s8\! |
    s2. s4. |
    s8 s4\< s4. s4 s8\! |
    s8 s4\> s2. |
    s2. s4.\! |
    
    \barNumberCheck 17
    s4. s\< s4 s8\! |
    s8 s4\> s4. s4 s8\! |
    s4. s\< s4 s8\! |
    s2.\> s4 s8\! |
    s2. s4. |
    s8 s4\< s4. s4 s8\! |
    s4 s8\> s2. |
    s2. s4.\! |
  }
    
  \barNumberCheck 25
  s2.\pp |
  s2. |
}

% MIDI only 
pedal = {
  s2\sd s4\su\sd |
  s2\su\sd s4\su |
  s2\sd s4\su\sd |
  s4\su\sd s2\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su | 
  s2\sd s4\su\sd |
  s2\su\sd s4\su |
  
  \barNumberCheck 9
  s2.\sd |
  s4\su\sd s2\su\sd |
  s2.\su\sd |
  s4\su\sd s2\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su |
  s4\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 17
  s2.\su\sd |
  s4\su\sd s2\su\sd |
  s2.\su\sd |
  s4\su\sd s2\su\sd |
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su |
  s4\sd s\su\sd s\su\sd |
  s4\su\sd s\su\sd s\su\sd |
  
  \barNumberCheck 25
  s2\su\sd s4\su\sd |
  s2\su\sd s4\su |
}

preludeTwentyThreeNotes =
\score {
  \header {
    title = "23."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 23"
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

preludeTwentyThreeMidi =
\book {
  \bookOutputName "prelude-op11-no23"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {}
  }
}
