%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 3) (0 . 2) (0 . 1) (0 . 0)) \etc
slurShapeB = \shape #'((0 . -3) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . 0) (0 . -1) (0 . -1) (0 . 1)) \etc
slurShapeD = \shape #'((0 . -1) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeE = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 2)) \etc
slurShapeF = \shape #'((0 . -1) (0 . 0.5) (0 . 0.5) (0 . -1)) \etc
slurShapeG = \shape #'((0 . 0) (0 . -0.5) (0 . -1) (0 . 0)) \etc
slurShapeH = \shape #'((0 . 0) (0 . -3) (0 . 1) (0 . 0)) \etc
slurShapeI = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . -1.5)) \etc
slurShapeJ = \shape #'((0 . -2) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeK = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . -1)) \etc
slurShapeL = \shape #'((0 . 1) (0 . 0.5) (0 . 0) (0 . 0)) \etc
slurShapeM = \shape #'((0 . 0) (0 . -5) (0 . 0.5) (0 . 2)) \etc
slurShapeN = \shape #'((0 . 0) (0 . -4) (0 . -0.5) (0 . 2)) \etc

%%% Music %%%

global = {
  \time 3/4
  \key fs \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup "Allegro agitato" #2 #0 132
  \omit TupletBracket
  \omit TupletNumber
  r4 a'-\slurShapeA ( cs') |
  r4 a,-\slurShapeA ( bs') |
  \tuplet 3/2 { r8 cs( a  gs fs d  cs b fs } |
  a2.) |
  r4 d( fs') |
  r4 d,( es') |
  \tuplet 3/2 { r8 fs( d  cs b g  fs e b } |
  d2.) |
  
  \barNumberCheck 9
  \tuplet 3/2 { r8 bs( cs  d gs cs,  cs'[ bs, r16 b] } |
  b2.) |
  \tuplet 3/2 { r8 as( b  cs fs b,  a'[ a, r16 fs] } |
  e2.) |
  \voiceOne
  \tuplet 3/2 { cs8-\slurShapeE ( d8. d'16 } d4 a) |
  \tuplet 3/2 { e8( es8. es'16 } es4 d) |
  \oneVoice
  \tuplet 3/2 { 
    fs,8-\slurShapeF ( bs cs  fs b, bs  a' gs d |
    cs8 cs' a  gs fs d  cs a gs |
  }
  
  \barNumberCheck 17
  fs8) r d'4( fs') |
  r4 d,( es') |
  \tuplet 3/2 { r8 fs( d  cs b g  fs e b  } |
  d2.) |
  r4 g( b') |
  r4 g,( as') |
  \tuplet 3/2 { r8 b( a  fs e c  b a e } |
  g2.)
  
  \barNumberCheck 25
  \tuplet 3/2 { r8 es( fs  g cs fs,  fs'[ es, r16 e] } |
  e2.) |
  \tuplet 3/2 { r8 ds-\slurShapeI ( e  fs b e, d'[ d, r16 b] } |
  a2.) |
  \voiceOne
  \tuplet 3/2 { fs8-\slurShapeE ( g8. g'16 } g4 d) |
  \tuplet 3/2 { a8-\slurShapeE ( as8. as'16 } as4 fs) |
  \tuplet 3/2 { as,8-\slurShapeK ( b8. <g' b>16 } q4.. <b,, g' b>16 |
  \oneVoice
  q2.) |

  
  \barNumberCheck 33
  \tuplet 3/2 { 
    g'8( b cs  e cs d  c' b g |
    fs d' c  b a fs  e d b |
    g8 b cs  e cs d  c' b g |
    fs8[ e' r16 c16]  b8 a fs  e d b) 
  }
  r4 g-\slurShapeA ( b') |
  r4 fs,-\slurShapeA ( bs') |
  \tuplet 3/2 { r8 cs( a  gs fs d  cs b fs } |
  a2.) |
  
  \barNumberCheck 41
  r4 g( g') |
  \tuplet 3/2 { d'8( cs b  g fs e  d b g) } |
  r4 es-\slurShapeL ( cs') |
  \tuplet 3/2 { cs'8( b a  g es d  cs a g~ } |
  \voiceTwo g4) s2 |
  \tuplet 3/2 { r8 d'( b  a gs fs  d cs b } |
  a4) s2 |
  s2. |
  
  \barNumberCheck 49
  \tuplet 3/2 { b'8\rest fs''^( d  cs b g  fs e b } |
  \voiceOne d4 fs) r
  \oneVoice \tuplet 3/2 { b,8\rest cs'( a  gs fs d  cs b fs } |
  a2.) |
  \tuplet 3/2 { r8 cs'( a  gs fs d  cs b fs } |
  a2.) |
  R2. * 2 |
  \bar "|."
}

rightHandLower = \relative {
  \omit TupletBracket
  \omit TupletNumber
  \voiceTwo
  s2. * 8 |
  
  \barNumberCheck 9
  s2. * 4
  \tuplet 3/2 { s8 d'4~ } d2 |
  \tuplet 3/2 { s8 es4~ } es2 |
  s2. * 2 |
  
  \barNumberCheck 17
  s2. * 8 |
  
  \barNumberCheck 25
  s2. * 4 |
  \tuplet 3/2 { s8 g4~ } g2 |
  \tuplet 3/2 { s8 as4~ } as2 |
  \tuplet 3/2 { s8 b4~ } b4.. s16 |
  s2. |
  
  \barNumberCheck 33
  s2. * 8 |
  
  \barNumberCheck 41
  s2. * 4 |
  \voiceTwo \tuplet 3/2 { b'8\rest fs'8^( d  cs b g  fs e b } |
  \voiceOne d4 fs) r |
  \oneVoice \tuplet 3/2 { b,8\rest cs'( a gs fs d cs b fs } |
  a2.) |
  
  \barNumberCheck 49
  s2. |
  \voiceTwo \tuplet 3/2 { r8 d( b  a gs fs  d cs b } |
  a4) s2 |
  
}

rightHand = {
  \global
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHand = \relative {
  \global
  \mergeDifferentlyDottedOn
  \override Slur.details.region-size = 10
  \override Slur.eccentricity = 1
  \clef bass
  cs,8-\slurShapeB ( fs cs' a' fs' cs,) |
  cs,8-\slurShapeB ( fs d' a' fs' d,) |
  cs,8-\slurShapeC ( fs cs' a' fs' cs,) |
  cs,8-\slurShapeB ( fs cs' a' fs' cs,) |
  cs,8-\slurShapeB ( b' fs' d' b' fs,) |
  cs,8-\slurShapeB ( b' g' d' b' g,) |
  cs,,8-\slurShapeB ( b' fs' d' b' fs,) |
  cs,8-\slurShapeB ( b' fs' d' b' fs,) |
  
  \barNumberCheck 9
  cs,8-\slurShapeC ( gs' es' b' es es,) |
  d,8-\slurShapeB ( fs fs' b fs' fs,) |
  ds,8( b' fs' a b a) |
  e,8-\slurShapeD ( cs' e a cs cs,) |
  <<
    {
      es,8( b' a') fs,( b a') |
      g,8( cs b') gs,( cs b') |
      a,8( ds cs') gs,( fs' bs) |
    }
    \\
    { 
      es,,4. fs |
      g4. gs |
      a4. gs |
    }
  >>
  cs8-\slurShapeG ( b' fs'4 es) |
  
  \barNumberCheck 17
  fs,,8-\slurShapeB ( b fs' d' b' fs,) |
  fs,8-\slurShapeB ( b g' d' b' g,) |
  fs,8-\slurShapeB ( b fs' d' b' fs,) |
  fs,8-\slurShapeB ( b fs' d' b' fs,) |
  fs,8( e' b' \clef treble g' e' b,) |
  \clef bass fs,( e' c' \clef treble g' e' c,) |
  \clef bass fs,,( e' b' \clef treble g' e' b,) |
  \clef bass fs,( e' b' \clef treble g' e' b,) |
  
  \barNumberCheck 25
  \clef bass fs,-\slurShapeH ( cs' as' e' as as,) |
  g,8( b b' \clef treble e b' b,) |
  \clef bass gs,8( e' b' d e d) |
  a,8-\slurShapeJ ( fs' a d fs fs,) |
  <<
    {
      as,4. b |
      c4. cs |
    }
    \\
    {
      as8( e' d') b,( e d') |
      c,8( fs e') cs,( fs e') |
    }
  >>
  d,8( g d' g, d g,) |
  d8( g g' d g d') |
  
  \barNumberCheck 33
  d,8( b' g' b, d' g,) |
  d,8( c' fs c c' fs,) |
  d,8( b' g' b, d' g,) |
  d,8( c' fs c d, d) |
  d,8-\slurShapeB ( g d' b' g' d,) |
  d,8-\slurShapeB ( gs fs' bs fs' fs,) |
  cs,8-\slurShapeB ( fs d' b' fs' d,) |
  cs,8-\slurShapeB ( fs cs' a' fs' cs,) |
  
  \barNumberCheck 41
  cs,8( b' d b' d d,) |
  \clef treble b''4 r r |
  \clef bass cs,,,8( b' g' b es g,) |
  \clef treble b'4 r r |
  \clef bass fs,,8-\slurShapeM ( b g' e' b' g,) |
  fs,8( d' a' d, fs'4) |
  <<
    {
      \oneVoice fs,,8( d' a' b fs' fs,~ |
      \voiceThree fs4) s2 |
    }
    \\
    {
      s2. |
      fs,8( cs' a' cs fs fs,) |
    }
  >>
  
  \barNumberCheck 49
  fs,8-\slurShapeM ( b g' e' b' g,) |
  fs,8( d' a' d, fs'4) |
  fs,,8-\slurShapeN ( d' a' b fs' fs,) |
  fs,8-\slurShapeB ( cs' a' cs fs fs,) |
  fs,8-\slurShapeN ( d' a' b fs' fs,) |
  fs,8-\slurShapeB ( cs' a' cs fs fs,) |
  fs,8-\slurShapeB ( cs' a' cs fs fs,) |
  fs,,4 r r|
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  s2.\p |
  s2. * 7 |
  
  \barNumberCheck 9
  \tuplet 3/2 { s8 s4\cresc } s2 |
  s2. * 5 |
  s2.\dim |
  s2. |
  
  \barNumberCheck 17
  s2.\p |
  s2. * 7 |
  
  \barNumberCheck 25
  s2.\cresc |
  s2. |
  s2.\cresc |
  s2. * 3 |
  s2.\f |
  s2. |
  
  \barNumberCheck 33
  s2.\pp |
  s2. * 2 |
  s2.\cresc |
  s2. * 2 |
  s2.\mf |
  s2. |
  
  \barNumberCheck 41
  s2. |
  \tag layout { s2.^\dimMarkup | } \tag midi { s2.\dim | }
  s2. * 2 |
  \tag layout { s2.^\ppSotoVoce } \tag midi { s2.\pp | }
  s2. * 3 |
  
  \barNumberCheck 49
  s2. * 6 |
  s2.^\smorz |
  s2. |
}

% for MIDI only
pedal = {
  s2.\sd |
  \repeat unfold 7 { s2.\su\sd | }
  
  \barNumberCheck 9
  \repeat unfold 4 { s2.\su\sd | }
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  
  \barNumberCheck 17
  \repeat unfold 8 { s2.\su\sd | }
  
  \barNumberCheck 25
  \repeat unfold 4 { s2.\su\sd | }
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s2. |
  
  \barNumberCheck 33
  \repeat unfold 8 { s2.\su\sd | }
  
  \barNumberCheck 41
  s2.\su\sd |
  s4 s2\su |
  s2.\sd |
  s4 s2\su |
  s2.\sd
  \repeat unfold 3 { s2.\su\sd | }
  
  \barNumberCheck 49
  \repeat unfold 6 { s2.\su\sd | }
  s2. |
  s4 s2\su |
}

forceBreaks = {
  s2. * 5 s2.\break
  s2. * 5 s2.\break
  s2. * 5 s2.\break
  s2. * 4 s2.\break
  s2. * 4 s2.\pageBreak
  
  s2. * 5 s2.\break
  s2. * 5 s2.\break
  s2. * 4 s2.\break
  s2. * 4 s2.\break
}

preludeEightNotes =
\score {
  \header {
    title = "8."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 8"
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

preludeEightMidi =
\book {
  \bookOutputName "prelude-op11-no08"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {
      \tempo 4 = 60
    }
  }
}
