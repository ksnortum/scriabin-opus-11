%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"
\include "force-initial-clef.ily"

%%% Positions and shapes %%%

slurShapeC = \shape #'(
                        ((0 . -1) (7 . 1) (0 . 0) (0 . 0))
                        ((0 . 1) (0 . 1) (0 . 0) (0 . 0))
                        ) \etc
slurShapeF = \shape #'((0 . 0) (0 . 0) (0 . 1) (0 . 1)) \etc
slurShapeG = \shape #'((0 . 0) (0 . 0) (0 . 1) (0 . 1)) \etc 
slurShapeH = \shape #'((-1 . 3) (0 . 2) (-2 . 1) (0 . 0)) \etc 
slurShapeI = \shape #'((-0.5 . 2.5) (0 . 1) (0 . 0) (0 . 0)) \etc
slurShapeJ = \shape #'(
                       ((0 . 0.5) (0 . 1) (0 . 0) (0 . 0))
                       ((0 . -1) (0 . 0) (0 . 0) (0 . 0))
                       ) \etc
slurShapeM = \shape #'((0 . -1) (0 . 0) (0 . -1) (0 . -1)) \etc
slurShapeN = \shape #'((0 . 2) (0 . 1) (0 . 0) (0 . 0)) \etc
slurShapeO = \shape #'((0 . 2) (0 . 1) (0 . 0) (0 . 0)) \etc

tieShapeA = \shape #'((0.25 . 0) (0 . 0) (0 . 0) (0 . -0.5)) \etc

moveAccidentalA = \once \override Staff.Accidental.X-offset = -1.5
moveAccidentalB = \once \override Staff.Accidental.X-offset = -1.5
moveClefA = \once \override Staff.Clef.extra-offset = #'(0.75 . 0) 

%%% Music %%%

global = {
  \time 3/4
  \numericTimeSignature
  \key a \minor
  \accidentalStyle piano
  % Group eight-notes in twos
  \set Timing.beamExceptions = #'()
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = 1,1,1
}

rightHandUpper = \relative {
  r4 r8 e''( f c' |
  b4.^\rit a8 a,4) |
  r8 d(^\aTempo g f b,4) |
  r8 b( f' e a,4) |
  r4 r8 b( c g' |
  fs4.^\rit e8 e,4) |
  r8^\aTempo a( d c fs,4) |
  r8 f( c' b e, bf') |
  
  \barNumberCheck 9
  r4 r8 e,( a cs |
  <d, bf' d>2.) |
  r4 r8 g( bf d |
  <f, bf f'>2.) |
  r4 \voiceOne f'4---\slurShapeC ( e-- |
  ds4-- c'-- b-- |
  \oneVoice d,4. d8 e f |
  c8 as b f'4 e8) |
  
  \barNumberCheck 17
  r4 r8 e8( f c' |
  b4. a8 a,4) |
  r8 d( g f c4) |
  r8 c( f e b4) |
  r4 r8 ds8( e b' |
  as4. gs8 gs,4) |
  r8 cs( fs e b4) |
  r8 b( e ds as4) |
  
  \barNumberCheck 25
  r4 r8 as( ds fss |
  <as, e' as>2.) |
  r4 r8 g-\slurShapeH ( b e |
  <g, c g'>2.) |
  r4 \voiceOne c4-\slurShapeI ( b |
  as4 g' fs |
  \oneVoice a,4. a8 b c |
  b8 g fs ds fs e) |
  
  \barNumberCheck 33
  r8 fs[( a\< g b e]\! |
  cs'8\> b r\! fs\< a g\! |
  \voiceOne fs2 e4 |
  ds4 e g |
  \oneVoice fs8[ a g d] ds4~ |
  ds8[ fs e a,] b4~ |
  b8[ d fs, g a b] |
  cs8[ d e d fs g]) |
  
  \barNumberCheck 41
  r8 a,[-\slurShapeJ ( c bf d g] |
  e'[ d bf a c bf] |
  \voiceOne a2 g4 |
  fs4 g4. bf8 |
  \oneVoice a8[ c bf f fs g] |
  a8[ g c, d f d] |
  a[ bf c bf d a] |
  f'8[ gs, b' ds, f e]) |
  
  \barNumberCheck 49
  r4 r8 e( f c' |
  b4. a8) a,4 |
  r8 d( g f b,4) |
  r8 bf( f' e a,4) |
  r4 r8 a( bf f' |
  e4. d8 d,4) |
  r8 g( c bf e,4) |
  r8 ef( bf' a d, af') |
  
  \barNumberCheck 57
  r4 r8 d,( g b |
  <d, gs d'>2.) |
  r4 r8 gs-\slurShapeN ( b e |
  <gs, f'>2.) |
  r4 \voiceOne f'-\slurShapeO ( e |
  ds4 c' b |
  \oneVoice d,4. d8 e cs |
  d8. b'16 b4 \voiceOne \hideNoteHead ds,4~ |
  
  \barNumberCheck 65
  ds4 e8) r8^\rit \oneVoice <d, g>4 |
  <d gs>4 <d a'> <d a' f'> |
  r8 a'-\slurShapeM ^( \voiceOne g' f \oneVoice gs,4~ |
  gs8 a <c, e c'>2) |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 4 |
  s4 a'2~ |
  a4 ds g,\rest |
  s2. * 2 |
  
  \barNumberCheck 17
  s2. * 8 |
  
  \barNumberCheck 25
  s2. * 4 |
  s4 e2~ |
  e4 as r |
  s2. * 2 |
  
  \barNumberCheck 33
  s2. * 2 |
  g2. |
  b2. |
  s2. * 4 |
  
  \barNumberCheck 41
  s2. * 2 |
  bf2. |
  d2. |
  s2. * 4 |
  
  \barNumberCheck 49
  s2. * 8 |
  
  \barNumberCheck 57
  s2. * 4 |
  s4 a2~ |
  a4 ds2 |
  s2. |
  s2 <a~ ds>4 |
  
  \barNumberCheck 65
  a2 s4 |
  s2. |
  s8 \hideNoteHead a~ a4 s |
  s2. |
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
  \clef treble
  a'2.~ |
  a4 s2 |
  s4 a2( |
  a4 gs e) |
  \clef bass e2.~ |
  e4 s2 |
  s4 e2( |
  ds4 d2) |
  
  \barNumberCheck 9
  <cs e>2. |
  s2. |
  <bf g'>2. |
  s2. * 3 |
  s4 a'2 |
  s4 \clef treble a4( gs) |
  
  \barNumberCheck 17
  a2.~ |
  a4 s2 |
  s4 a2( |
  a2 gs4~ |
  gs4) gs2~ |
  gs4 \clef bass s2 |
  ds,4 \moveClefA \clef treble gs'2( |
  gs2 fss4) \clef bass |
  
  \barNumberCheck 25
  <fss, ds'>2. |
  s2. |
  <g e'>2. |
  s2. * 3 |
  s4 e'2 |
  s2. |
  
  \barNumberCheck 33
  b2.-\tieShapeA ~ |
  \hideNoteHead \voiceFour b2. |
  s2 s8 \hideNoteHead b~ |
  \hideNoteHead b2. |
  \voiceSix b2 bf4 |
  a4 c2 |
  s2. * 2 |
  
  \barNumberCheck 41
  \voiceThree
  d2.~ |
  \hideNoteHead \voiceFour d2. |
  s2. |
  \clef treble
  s2. |
  \voiceSix d2 df4 |
  c4 ef2 |
  \clef bass \voiceThree r4 <f, d' f> s |
  s2. |
  
  \barNumberCheck 49
  \clef treble a'2.~ |
  a4 s2 |
  s4 a2( |
  gs4 g2) |
  \clef bass d2.~ |
  d4 s2 |
  s4 d2( |
  cs4 c2) |
  
  \barNumberCheck 57
  <b d>2. |
  s2. |
  <gs b>2. |
  s2. * 5 |
  
  \barNumberCheck 65
  s2. * 2 |
  s4 \voiceFour <e c'^~ ds> \voiceThree c'8 b |
  s2. |
}

leftHandLower = \relative {
  \voiceFour
  \clef treble
  b4-\slurShapeF ( c d |
  ds4 \clef bass \oneVoice f, b, |
  e,4) \clef treble \voiceFour b''( d) |
  d2( c4) |
  \clef bass fs,4( g a |
  as4 \oneVoice c, fs, |
  <b, b'>4) \voiceFour fs''4( a) |
  a2( gs4) |
  
  \barNumberCheck 9
  g4 a g |
  f4 <bf f'> f |
  e4 f e |
  \oneVoice d4 <bf' f'> d, |
  c4 <f c' f> c |
  b4 <fs' ds' a'> d\rest |
  f4 \voiceFour b d |
  \oneVoice e, \clef treble \voiceFour d'2 |
  
  \barNumberCheck 17
  b4-\slurShapeG ( c d |
  ds4 \oneVoice \clef bass \oneVoice f, b, |
  e,4) \clef treble \voiceFour b''( c |
  d2. |
  \moveAccidentalA ds4) b( cs |
  \moveAccidentalB css4 \clef bass \oneVoice e, as, |
  \voiceFour ds,4) \clef treble as''4( b |
  cs2.) |
  
  \barNumberCheck 25
  \clef bass
  cs,4 ds cs |
  \oneVoice c4 <g' e'> c, |
  \voiceFour b4 c b |
  \oneVoice a4 <e' c'> a, |
  g4 <c g' c> g |
  fs4 <cs' as' e'> r |
  c4 \voiceFour fs a |
  \oneVoice <b, a' ds>4 <g' b> r |
  
  \barNumberCheck 33
  <<
    { 
      \voiceFour e4 d cs~ |
      <cs b'>2. |
      e4 d cs~ |
      <cs b'>2. |
      d2. |
      d2. |
      s2. |
    }
    \new Voice {
      s2. |
      \voiceFive g'4 e b\rest |
      b4\rest b8\rest g( as b |
      g'4. fs8 fs e |
      d4 g2~ |
      g4 g fs |
      \oneVoice g,,4 <d' b' d>) r
    }
  >>
  \oneVoice R2. |
  
  \barNumberCheck 41
  <<
    {  
      \voiceFour g4 f e~ |
      <e d'>2. |
      g4 f e |
      \clef treble s2. |
      f2. |
      f2. |
    }
    \new Voice { 
      s2. |
      \voiceFive bf'4 g2
      d4\rest r8 bf( cs d |
      \clef treble bf'8[\> a c bf a g]\! |
      f4 bf2~ |
      bf4 bf a) |
    }
  >> 
  \voiceFour bf,,2 \oneVoice r4 |
  e4 <d' gs> r |
  
  \barNumberCheck 49
  \clef treble \voiceFour b4( c d |
  ds4 \clef bass \oneVoice f, b, |
  e,4) \clef treble \voiceFour b''4( d) |
  d2( cs4) |
  \clef bass e,4( f g |
  gs4 \oneVoice bf, e, |
  <a, a'>4) \voiceFour e''( g) |
  g2( fs4) |
  
  \barNumberCheck 57
  f4 g f |
  \oneVoice e4 <b' e> e, |
  \voiceFour d4 e d |
  \oneVoice df4 <f b f'> df |
  c4 <f c' f> c |
  b4 <fs' ds' a'> r |
  f4 <b a'> r |
  r4 r <f b> |
  
  \barNumberCheck 65
  <e c'>4. e8( f c' |
  b4. a8 b,4 |
  e,4) s \voiceFour <e' d'> |
  \oneVoice a,,4 <a' e' a>2 |  
}

leftHand = {
  \global
  \bassToTreble
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >> 
}

% For MIDI only
pedal = {
  s2. * 2 |
  s2.\sd |
  s2.\su |
  s2. * 2 |
  s2.\sd |
  s2.\su |
  
  \barNumberCheck 9
  s2.\sd |
  s2.\su\sd | 
  s2.\su |
  s2.\sd | 
  s2.\su\sd | 
  s2\su\sd s4\su |
  s2.\sd |
  s2.\su |
  
  \barNumberCheck 17
  s2. * 2 |
  s2\sd s4\su |
  s2. * 5 |
  
  \barNumberCheck 25
  s2. |
  s2.\sd | 
  s2.\su |
  s2.\sd | 
  s4.\su\sd s\su | 
  s2\sd s4\su |
  s2\sd s8 s\su |
  s2. |
  
  \barNumberCheck 33
  s2. * 6 |
  s4.\sd s\su |
  s2.
  
  \barNumberCheck 41
  s2. * 8 |
  
  \barNumberCheck 49
  s2. * 2 |
  s2.\sd |
  s2.\su |
  s2. * 2 |
  s2.\sd |
  s2.\su |
  
  \barNumberCheck 57
  s2. |
  s2.\sd | 
  s2.\su |
  s2.\sd | 
  s2.\su\sd | 
  s2\su\sd s4\su |
  s2\sd s4\su |
  s2. |
  
  \barNumberCheck 65
  s2. * 2 |
  s2\sd s4\su |
  s2\sd s4\su |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2\p\< s8 s\! |
  s2\> s4\! |
  s2. * 2 |
  s4. s4\< s8\! |
  s4 s\> s8 s\! |
  s2. * 2 |
  
  \barNumberCheck 9
  s2 s4-\tweak extra-offset #'(-1 . 0) \cresc |
  s2. * 5 |
  s4. s-\tweak extra-offset #'(1 . 0) \dim |
  s2. |
  
  \barNumberCheck 17
  s4 s4.\< s8\! |
  s2\> s4\! |
  s2. * 2 |
  s4. s4\pp\< s8\! |
  s2\> s4\! |
  s2. * 2 |
  
  \barNumberCheck 25
  s4 s2\cresc  |
  s2. * 3 |
  s4 s2\mf |
  s2. |
  s2.\dim |
  s2. |
  
  \barNumberCheck 33
  s2. * 2 |
  s2\> s4\! |
  s2. * 3 |
  s4 s2\> |
  s2 s8 s\! |
  
  \barNumberCheck 41
  s4 s4.\< s8\! |
  s8 s4\> s8\! s\< s\! |
  s4. s4\< s8\! |
  s2.\mf |
  s2 s8\< s\! |
  s4\> s2\! |
  s4. s\> |
  s2 s8\! s |
  
  \barNumberCheck 49
  s4.\p s4\< s8\! |
  s2\> s4\! |
  s2. * 2 |
  s4. s4\< s8\! |
  s4. s4\> s8\! |
  s2. * 2 |
  
  \barNumberCheck 57
  s4. s\< |
  s8 s\! s2 |
  s4. s4\< s8\! |
  s2. * 5 |
  
  \barNumberCheck 65
  s2. * 3 |
  s2.-\tweak X-offset 0 \pp |
}

forceBreaks = {
  s2. * 7 \break
  s2. * 8 \break
  s2. * 7 \break
  s2. * 7 \break
  s2. * 6 \pageBreak
  
  s2. * 6 \break
  s2. * 6 \break
  s2. * 7 \break
  s2. * 7 \break
}

tempi = {
  \set Score.tempoHideNote = ##t
  \tempo 4 = 100
  \textMark \markup \tempo-markup Allegretto #2 #0 138
  s2. |
  \set Score.tempoHideNote = ##t
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 3 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 9
  s2. * 5 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 17
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 3 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 25
  s2. * 5 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 33
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 3 |
  \tempo 4 = 92
  s2. |
  
  \barNumberCheck 41
  \tempo 4 = 100
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 3 |
  \tempo 4 = 92
  s2. |
  
  \barNumberCheck 49
  \tempo 4 = 100
  s2. |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 3 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 57
  s2. * 5 |
  \tempo 4 = 92
  s2. |
  \tempo 4 = 100
  s2. * 2 |
  
  \barNumberCheck 65
  s4. \tempo 4 = 92 s |
  \tempo 4 = 84
  s2. |
  \tempo 4 = 76
  s2.
  \tempo 4 = 69
  s2. |
}

preludeTwoNotes =
\score {
  \header {
    title = "2."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 2"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \forceBreaks
    \new Devnull \tempi
  >>
  \layout {}
}

\include "articulate.ly"

preludeTwoMidi =
\book {
  \bookOutputName "prelude-op11-no02"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
