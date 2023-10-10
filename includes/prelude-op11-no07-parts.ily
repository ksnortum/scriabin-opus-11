%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 0) (0 . -0.5) (0 . -0.5) (0 . 0)) \etc
slurShapeB = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . -1))
                        ) \etc
slurShapeC = \shape #'(
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                        ((0 . 0) (0 . 0) (0 . 0) (0 . -0.5))
                        ) \etc

%%% Music %%%

global = {
  \time 6/8
  \key a \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  % tempo eighth = 152, SrcB
  \textMark \markup \tempo-markup "Allegro assai" #3 #0 152
  \voiceOne
  \partial 8 a'8-\slurShapeA (
  gs8 a d  cs4) d8-\slurShapeA ( |
  cs8 d gs  fs4) fs8-.( |
  e8 d) d-.(  cs b) <d, fs>( |
  <d e>4 <d fs>8  <d e>4) a'8-\slurShapeB ( |
  gs8 a fs'  e4) cs8( |
  b8 a gs'  fs4) fs8-.( |
  e8 d) d-.(  cs b) cs( |
  a4 cs8 a4) a8( |
  
  \barNumberCheck 9
  gs8 a) <a cs>(  <gs b> <a cs>) q( |
  <gs b>8 <a cs> <ds, ds'>-> <e e'>4->) g8( |
  fs8 g) <g b>(  <fs a> <g b>) q( |
  <fs a>8 <g b> <cs, cs'>  <d d'>4) <a' c>8( |
  <a b>8 <a c> q~ q4) q8( |
  <a b>8 <a c> q~ q4) <fs fs'>8( |
  <e e'>8 <fs fs'>) <a a'>(  <gs gs'> <fs fs'>) q( |
  q8 <e e'> <cs' cs'>  q <b b'>) <a a'>( |
  
  \barNumberCheck 17
  <gs gs'>8 <a a'> <d d'>  <cs cs'>4) <d d'>8-\slurShapeC ( |
  <cs cs'>8 <d d'> <gs gs'> <fs fs'>4) <d' fs>8( |
  <cs e>8 <b d>) q(  <a cs> <fs b>) <d fs>( |
  <cs e>8 <b d>) q(  <a cs> <fs b>) <d fs>( |
  <d e>4 <d fs>8 <cs e>4) <d fs>8( |
  <d e>4 <d b'>8 <cs e>4 <d fs>8 |
  <cs e>4.) b'4\rest b8\rest |
  \oneVoice
  r4 r8 <a cs a'>4. |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  \partial 8 { r16 b( }
  cs16 b cs e,) r e'(  fs e a cs,) r e( |
  fs16 e fs b,) r a'(  b a d fs,) r gs(
  a16 gs fs b,) r e(  fs[ e d fs,]) fs( gs |
  a16[ gs fs e]) fs( gs  a gs fs e) r b'( |
  cs16 b cs e) r gs(  a gs a cs,) r d( |
  e16 d fs b,) r a'(  b a d fs,) r gs( |
  a16 gs fs b,) r e(  fs e d fs,) r e'( |
  fs16[ e b cs]) d( e  fs e b cs) r b |
  
  \barNumberCheck 9
  cs16 b cs e, cs' ds  e ds cs e, cs' ds |
  e16 ds cs a a' cs  a b gs e r a, |
  b16 a b d, b' cs  d cs b d, b' cs |
  d16 cs b g g' b  g[ a fs d] c e |
  b16 e c e c ds  c e c ds c e |
  b16 e c e c ds  c[ e c ds] d' a |
  d16 a d a d fs  d a d a d gs, |
  d'16 gs, d' gs, gs' e  gs e fs e r b( |
  
  \barNumberCheck 17
  cs16 b cs e,) r e'(  fs e a cs,) r e( |
  fs16 e fs b,) r a'(  b[ a fs b,]) fs' gs |
  a16 gs fs d d e  fs e d b fs gs |
  a16 gs fs d d e  fs e d b fs gs |
  a16 gs fs e fs gs  a gs fs e fs gs |
  a16 gs fs e fs gs  a gs fs e fs gs |
  a16 gs fs e a gs  fs e a gs fs e |
  s2. |
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
  \articulationInsideSlur
  \clef bass
  \partial 8 e,8(
  <a, a'>8 e'') e,(  <a, a'> e'') d,( |
  <a a'>8 fs'') d,(  <a a'> b'') e,,( |
  <a, a'>8 fs'') e,(  <a, a'> fs'') e,( |
  <a, b'>4) e'8(  <a, b'>4) e'8( |
  <a, a'>8 e'') fs,(  fs, e'') fs,( |
  <b, b'>8 d') fs,(  <b, b'> a'') b,( |
  <e, fs'>8 b'') b,(  <e, fs'> a') e,( |
  <a, a'>8 e'') e,(  <a, a'> e'') cs,( |
  
  \barNumberCheck 9
  <fs, fs'>8 e'') cs,(  <fs, fs'> <a' a'>) <fs, fs'>( |
  <b, b'>8 <cs'' cs'>) <b,, b'>->(  <e e'>-> <b'' b'>) b,( |
  <e, e'>8 d'') b,(  <e, e'> <g' g'>) <e, e'>( |
  <a,  a'>8 <b'' b'>) <a,, a'>(  <d d'> <a'' a'>) <a, a'>( |
  <fs' fs'>4) <b, b'>8(\<  <g' g'>\> <fs fs'>)\! <a, a'>( |
  <fs' fs'>4) <b, b'>8(\<  <g' g'>\> <fs fs'>)\! <b, b'>( |
  <fs' d' a'> <d' a' d>) <b, b'>(  <fs' d' a'> <d' a' d>) <e,, e'>( |
  <e' b' gs'>8 <d' gs d'>) <e, e'>(  <e' d' gs>4) <e, e'>8( |
  
  \barNumberCheck 17
  <a,, a'>8 <e''' e'>) <e, e'>(  <a,, a'> <e''' e'>) <d, d'>( |
  <a, a'>8 <fs''' d' a'>) <d, d'>(  <a, a'> <fs''' d' a'>) <e, e'>( |
  <a,, a'>8 <fs''' b d a'>->) <e, e'>(  <a,, a'> <d'' a' b fs'>->) e,( |
  <a, b'>8 <b' fs' b>->) e,(  <a, b'> fs''->) e,( |
  <a, b'>4) e'8( <a, a'>4) e'8( |
  <a, b'>4) e'8( <a, a'>4) r8 |
  <a a'>4 r8 r4 <e e'>8(\f |
  <a, a'>4.) <e''' a e'> |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 8 s8\pp
  s2. |
  s8 s4\cresc s4. |
  s4 s16 s\dim s4. |
  s2.\p |
  s2 s8 s\cresc |
  s2. |
  s4 s8\dim s4 s16 s\p |
  s2. |
  
  \barNumberCheck 9
  s4 s8\cresc s4. |
  s4. s8\f s\dim s16 s\p |
  s8. s8.\cresc s4. |
  s4. s\f |
  s2. * 2 |
  s4 s16 s\cresc s4. |
  s4. s4 s8\ff |
  
  \barNumberCheck 17
  s2. |
  s4. s4 s8\dim |
  s4.\mp s8. s\dim s4. s\pp |
  s2.\ppp |
}

% MIDI only
pedal = {
  \partial 8 s8\sd 
  \repeat unfold 3 { s4.\su\sd s\su\sd | }
  s4\su\sd s8\su\sd s4\su\sd s8\su\sd |
  \repeat unfold 3 { s4.\su\sd s\su\sd | }
  s4\su\sd s8\su\sd s4\su\sd s8\su\sd |
  
  \barNumberCheck 9
  s4.\su\sd s\su\sd |
  s8\su\sd s\su\sd s\su\sd s4\su\sd s8\su\sd |
  s4.\su\sd s\su\sd |
  s8\su\sd s\su\sd s\su\sd s4\su\sd s8\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s4\su\sd s8\su\sd |
  s4 s8\su\sd s4 s8\su\sd |
  s4 s8\su\sd s4 s8\su\sd |
  
  \barNumberCheck 17
  s2.\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s4\su\sd s8\su\sd s4\su\sd s8\su\sd |
  s4\su\sd s8\su\sd s4\su\sd s8\su\sd |
  s4\su\sd s8\su s4 s8\sd |
  s2.\su\sd |
}

forceBreaks = {
  \partial 8 s8 
  s2. s2.\break
  s2. s2.\break
  s2. s2.\break
  s2. * 2 s2.\break
  s2. * 2 s2.\pageBreak
  
  s2. * 2 s2.\break
  s2. s2.\break
  s2. s2.\break
  s2. s2.\break
}

preludeSevenNotes =
\score {
  \header {
    title = "7."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 7"
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

preludeSevenMidi =
\book {
  \bookOutputName "prelude-op11-no07"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {
      \tempo 4. = 60
    }
  }
}
