%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'(
                        () () () ()
                        ((0 . -2.5) (0 . 30) (0 . 18) (0 . -7))
                        ) \etc
slurShapeB = \shape #'(
                        ((0 . -4) (0 . 1) (0 . 1) (0 . 2)) 
                        ((0 . 0) (0 . 0) (0 . 0) (0 . 0))
                      ) \etc
slurShapeC = \shape #'((0 . -1) (0 . 1) (0 . 0) (0 . -1)) \etc

moveDynamicA = \tweak extra-offset #'(-1 . -0.25) \etc

moveNotesA = \once \override Voice.NoteColumn.force-hshift = -1.5

moveAccidentalA = \once \override Accidental.extra-offset = #'(2.75 . 0)
moveAccidentalB = \once \override Accidental.extra-offset = #'(1 . 0)
moveAccidentalC = \once \override Accidental.extra-offset = #'(4 . 0)

moveTextA = \tweak extra-offset #'(0 . -3.5) \etc
moveTextB = \tweak extra-offset #'(2 . -3) \etc

beamPositionsA = \once \override Beam.positions = #'(3 . 4)

%%% Music %%%

global = {
  \time 4/2
  \key d \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup "Andante cantabile" #2 #0 40
  \partial 1 { <cs' g' a>2^( <d g b> }
  <cs a' cs>2 <d fs d'>) \voiceOne a'4~( \tuplet 3/2 { a8 gs a } b4.. cs16 |
  \oneVoice
  <cs, a' cs>2 <d fs d'>) <e fs cs'>^( <as, e' fs> |
  \voiceOne
  g'2. g4 g fs a g |
  fs4 e b' a)  a4~( \tuplet 3/2 { a8 gs a } b4.. cs16 |
  \oneVoice <cs, a' cs>2 <d fs d'>) \voiceOne d'4~( \tuplet 3/2 { d8 cs d }
    e4.. fs16 |
  \oneVoice
  <fs, d' fs>2 <g b g'>) <a b fs'>-\slurShapeB ( <ds, a' b> |
  \voiceOne
  c'2. \tuplet 3/2 { b8 c a' } g4 fs \moveNotesA \moveAccidentalB as, b |
  b4 c~ c <cs, g' cs> <c d'~>1-\moveTextA-\conAnima |
  
  \barNumberCheck 9
  d'4 cs e d-\moveTextB-\rit  b'-\rubato a g fs |
  g4 d e es fs2 d |
  a1) a4~( \tuplet 3/2 { a8 gs a } b4.. cs16 |
  \oneVoice <cs, a' cs>2 <d fs d'>) \voiceOne a''4~-\slurShapeC ( 
    \tuplet 3/2 { a8 gs a } b4.. cs16 |
  cs2 d1) \oneVoice <fs,,, d' fs>2 |
  q\breve\fermata |
  \bar "|."
}

rightHandLower = \relative {
  \set tieWaitForNote = ##t
  \mergeDifferentlyDottedOn
  \override Tie.minimum-length = 2 
  \voiceTwo
  \partial 1 { s1 }
  s1 <cs' g'>2 <d g>2 |
  s\breve |
  <b e>1 as2 b |
  a2 <a e'> <cs g'> <d g> |
  s1 <fs c'>2 <g c> |
  s\breve |
  <e a>1 <a b>2 <\single \moveAccidentalC ds, \single \moveAccidentalA a'!> |
  <e g>2~ q4 s a gs b a |
  
  \barNumberCheck 9
  <c, g'>2 <c fs>2*7/8 
    << { 
         \stemUp \magnifyMusic 0.63 { \beamPositionsA c16*1/4 fs~ d' d~ } 
           \stemDown
       } 
      \new Voice { 
        \voiceTwo \magnifyMusic 0.63 { s64 fs,8.*1/4 }
      } 
    >> 
    <fs d'>2 <g cs> |
  <g d'>2 <d gs> <d a'> <d fs> |
  d2 <g, cs> <cs g'> <d g> |
  s1 \grace { g8[~ cs]~ } <g cs>2 \grace { d16[~ g~ b~ d]~ } <d, g b d>2 |
  \grace { cs16[~ a'~ cs~ fs]~ } <cs, a' cs fs>2 \grace { d16[~ a'~ d~ fs]~ }
    <d, a' d fs>1 s2 |
  s\breve |
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
  \partial 1 { a8_(_\rubato e b' a  g fs a g }
  fs8 a, b a \tuplet 5/4 { d, a' fs' cs' b } a e b' a  g fs a g) |
  fs8-\slurShapeA _( a, b a  d, d' gs a  as cs, fs, cs'  d cs fs cs |
  e8 b cs d  e d e cs  fs, cs'4 as'8  e, e'4 d'8 |
  a,8 g'4 d'8  cs g cs b  a e b' a  g fs a g |
  fs8 a, b a  d, a' d a'  d a e' d  c b d c |
  b8 d, e d  g, g' cs d  ds fs, b, fs'  g fs b fs |
  a8 e fs g  a g a fs  ds' fs, b, fs'  b fs b, fs |
  e8 a g' a  a g a, e  f d'4 c'8  fs,, d'4 c'8 |
  
  \barNumberCheck 9
  g,8 d'4 c'8  gs, d'4 c'8  a, d4 c'8  as, g'4 cs8 |
  b, g'4 d'8  bf, gs'4 d'8  a, fs' cs' b  a gs b a |
  g8 fs a g  fs e b a~  <d, a'> e' b' a  g fs a g |
  fs8 a, b a  \tuplet 5/4 { d, a' fs' cs' b }  a e b' a
    g fs a g |
  fs8 a, b a  \tuplet 5/4 { d, a' fs' d' a }  a'2-^) <d,,, a' d> |
  q\breve\fermata |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 1 { s2\p\< s8 s\! s\> s\! }
  s1-\tweak X-offset 0 \pp s8 s\< \tuplet 3/2 { s4 s8\! } s4 s8\> s16 s\!\pp |
  s1. s4.\< s8\! |
  s\breve |
  s1\dim s4 \tuplet 3/2 { s8 s4\cresc } s2 |
  s2 s4 s\cresc s1 |
  s2 s4 s-\moveDynamicA\dim s1\p |
  s1. s8 s4.\cresc |
  s\breve |
  
  \barNumberCheck 9
  s1. s2\dim |
  s1 s2\p s\dim |
  s1 s\pp |
  s\breve |
  s1. s2\ppp |
  s\breve |
}

% MIDI only
pedal = {
  \partial 1 s2\sd s\su\sd |
  \repeat unfold 8 { s2\su\sd s\su\sd s\su\sd s\su\sd | } 
  
  \barNumberCheck 9
  \repeat unfold 4 { s2\su\sd s\su\sd s\su\sd s\su\sd | } 
  s2\su\sd s1.\su\sd |
  s\breve |
}

forceBreaks = {
  \partial 1 s1
  s\breve s\breve\break\noPageBreak
  s\breve * 2 s\breve\break\noPageBreak
  s\breve * 2 s\breve\break\noPageBreak
  s\breve * 2 s\breve\break\noPageBreak
}

preludeFiveNotes =
\score {
  \header {
    title = "5."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 5"
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

preludeFiveMidi =
\book {
  \bookOutputName "prelude-op11-no05"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {
      \tempo 4 = 52
    }
  }
}
