%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

moveTupletNumberA = \tweak TupletNumber.Y-offset -2.75 \etc
moveRestA = \tweak Rest.Y-offset -0.5 \etc

forceHShiftA = \tweak NoteColumn.force-hshift 0.35 \etc

beamPositionsA = 
  \once \alterBroken positions #'((-5.5 . -5.5) (-4.5 . -3.5)) Beam 
beamPositionsB = 
  \once \alterBroken positions #'((-5.5 . -5.5) (-4.5 . -3.5)) Beam 
beamPositionsC = 
  \once \alterBroken positions #'((-6 . -6) (-4.5 . -3.5)) Beam 
beamPositionsD = 
  \once \alterBroken positions #'((-6.5 . -6.5) (-5.5 . -4.5)) Beam
beamPositionsE = 
  \once \alterBroken positions #'((-7 . -7) (-5.5 . -4.5)) Beam 
beamPositionsF = 
  \once \alterBroken positions #'((-5.5 . -5.5) (-4.5 . -3.5)) Beam 
beamPositionsG = 
  \once \alterBroken positions #'((-5.5 . -5.5) (-4.5 . -3.5)) Beam 
beamPositionsH = 
  \once \alterBroken positions #'((-5.5 . -5.5) (-4.5 . -3.5)) Beam 
beamPositionsI = 
  \once \alterBroken positions #'((3 . 3) (4 . 5)) Beam 
beamPositionsJ = \once \override Beam.positions = #'(4 . 5)
beamPositionsK = 
  \once \alterBroken positions #'((-3 . -3) (-2 . -1)) Beam 

%%% Music %%%

global = {
  \time 2/4
  \key ef \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \omit TupletNumber
  \omit TupletBracket
  \partial 16 * 4/5 r16 * 4/5
  ef''4 \tuplet 3/2 { d8[ c r16 bf] } |
  g4 \tuplet 5/4 { f16 g af bf16. d32 } |
  g4 \tuplet 3/2 { f8[ ef r16 c] } |
  bf4 \tuplet 5/4 { af16 bf c d16. g32 } |
  \voiceOne cf4 \tuplet 3/2 { bf8 af8. ff16 } |
  ef4 d |
  \oneVoice <ff, af d>2 |
  <ef g ef'>2 |
  
  \barNumberCheck 9
  <gf cf gf'>4 \tuplet 5/4 { f'16 ef df cf16. bf32 } |
  \tuplet 3/2 { bf8 af bf cf ef gf } |
  <cf, gf' bf>4 \tuplet 3/2 { af'4 gf8 |
    f8 ef df af df ef |
  }
  \key fs \minor
  <e, a e'>4 \tuplet 5/4 { ds'16 cs b a16. gs32 } |
  \tuplet 3/2 { gs8 fs gs a cs e } |
  \voiceOne gs4 \tuplet 3/2 { fs4 gs8 } |
  \key ef \major
  \tag layout { \afterGrace 15/16 a2\trill { af16[ a] } | }
  \tag midi   { \repeat unfold 15 { bf64 a } af a | }
  
  \barNumberCheck 17
  \oneVoice <bf, d bf'>4 \tuplet 3/2 { <bf d a'>8-- <bf d af'>-- <bf d f>-- |
    <cf ef af>8-- <cf ef gf>-- <gf cf ef>--  < ef gf df'>-- <ef gf cf>--
      <cf ef af>-- |
  }
  <bf d bf'>4 \tuplet 3/2 { a'8 af f |
  af8 gf ef df cf af16 \clef bass d,[( } |
  \tuplet 5/4 {
    gf16 f d' bf])  ef,[( af gf ef' cf])  \beamPositionsK e,[( |
    bf'16 af e' c])  f,[( bf af f' df])  f,[( |
    ef' af, f' d])  \clef treble af[( g' d bf' f])  d[( |
    c'16 af d bf]  af[ g' d bf' f]) r |
  }
  
  \barNumberCheck 25
  <ef ef'>4 \tuplet 3/2 { <d d'>8[ <c c'> \moveRestA r16 <bf bf'>] } |
  <g g'>4 \tuplet 5/4 { <f f'>16 <g g'> <af af'> <bf bf'>16. <d d'>32 } |
  <g g'>4 \tuplet 3/2 { <f f'>8[ <ef ef'> r16 <c c'>] } |
  <bf bf'>4 \tuplet 5/4 { <af af'>16 <bf bf'> <c c'> <d d'>16. <g g'>32 } |
  %{\ottava 1%} <c af' c>4 \tuplet 3/2 { <bf bf'>8 <af af'> <f f'> |
    <af af'>8 <g g'> <f f'> <ef ef'> %{\ottava 0%} <c c'> <af af'> |
  }
  <g g'>4~ q8 <f f'> |
  \oneVoice <ef ef'>2 |
  
  \barNumberCheck 33
  <df' af' c>4 \tuplet 3/2 { bf'8 af f |
    \voiceOne af8 g f ef c af |
  }
  g4~ g8 f |
  ef2 |
  g4~ g8 f |
  <g, ef'>4 <af d g> |
  <g ef'>2 |
  \clef bass bf,,2 |
  ef,2 |
  \bar "|."
}

rightHandLower = \relative {
  \omit TupletBracket
  \voiceTwo 
  \partial 16 * 4/5 s16 * 4/5
  s2 * 4 |
  <cf'' ff af>4 \moveTupletNumberA \tuplet 3/2 { <cf ff>4 <d, cf'>8 } |
  \omit TupletNumber
  % second beat, SrcB (bf in the triplet, f quarter note)
  <ef cf'>4 
    << 
      { \tuplet 3/2 { bf'8 af8. ff16 } } 
      \new Voice { \voiceFour \forceHShiftA ff4 } 
    >> |
  s2 * 2 |
  
  \barNumberCheck 9
  s2 * 4 |
  \key fs \minor
  s2 * 2 |
  <a ds>4 q |
  \key ef \major 
  <a ef'>4 s |
  
  \barNumberCheck 17
  s2 * 2 |
  s4 d, |
  ef s |
  s2 * 4 |
  
  \barNumberCheck 25
  s4 \voiceOne \tuplet 3/2 { af'4 d,8 } |
  d2 |
  s4 \tuplet 3/2 { af'4 f8 } |
  d2 |
  s4 df' |
  c4 \tuplet 3/2 { af4 c,8 } |
  d2 |
  s2 |
  
  \barNumberCheck 33
  s2 |
  \voiceTwo c4 r |
  af,2 |
  g2 |
  af2 |
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
  \partial 16 * 4/5 s16 * 4/5
  \tuplet 5/4 { 
    s8 af s16  s4 s16 |
    s8 bf s16  s4 s16 |
    s8 c s16  s4 s16 |
    s8 d s16  s4 s16 |
    s1 * 5/8 * 4 |
    
    \barNumberCheck 9
    s1 * 5/8 * 8 |
    
    \barNumberCheck 17
    s1 * 5/8 * 8 |
    
    \barNumberCheck 25
    \voiceFour s8 af s16  s4 s16 |
    \voiceThree s8 bf s16  s4 s16 |
    s8 c s16  s4 s16 |
    s8 d s16  s4 s16 |
  }
}

leftHandLower = \relative {
  \voiceFour
  \partial 16 * 4/5 \tuplet 5/4 { ef,16[(
    c'16 bf af' f]  ef[ c' bf af' f])  ef,,[( |
    c'16 bf bf' af]  ef[ c' bf f' bf,])  ef,,[( |
    c'16 bf c' af]  ef[ c' bf af' f])  \beamPositionsA ef,,[( |
    f'16 bf, d' af]  ef[ c' bf f' bf,])  \slurUp ef,,[( |
    bf'16 af af' ff]  ef[ bf' af ff' cf])  ef,,[( |
    bf'16 af af' ff]  ef[ bf' af ff' cf])  ef,,[( |
    df'16 cf af' ff]  ef[ bf' af ff' cf])  \beamPositionsB ef,,[( |
    cf'16 bf g' ef]  ef[ cf' bf g' ef])  ef,,[( |
    
    \barNumberCheck 9
    af16 gf gf' cf,]  ef[ af gf gf' cf,])  ef,,[( |
    bf'16 af gf' cf,]  ef[ bf' af gf' cf,])  eff,,[( |
    bf'16 af gf' cf,]  eff[ bf' af gf' cf,])  \beamPositionsC df,,[( |
    bf'16 af f' df]  df[ bf' af f' df])  cs,,[( | 
    \key fs \minor
    fs16 e e' a,]  cs[ fs e e' a,])  cs,,[( |
    gs'16 fs e' a,]  cs[ gs' fs e' a,])  \beamPositionsD c,,[( |
    gs'16 fs ds' a]  c[ gs' fs ds' a])  cf,,[( |
    \key ef \major
    gf'16 f ef' a,]  cf[ gf' f ef' a,])  bf,,[( |
    
    \barNumberCheck 17
    gf'16 f d' bf]  bf[ gf' f d' bf])  \beamPositionsE bf,,[( |
    af'16 gf ef' cf]  bf[ af' gf cf af])  bf,,[( |
    gf'16 f d' bf]  bf[ gf' f cf' af])  bf,,[( |
    af'16 gf ef' cf]  bf[ f' ef af gf])  \ottava -1 \oneVoice <bf,,, bf'> |
  }
  \ottava 0 <bf' bf'>4 \tuplet 3/2 { <af af'>8 <gf gf'> 
                                     \ottava -1 <bf, bf'> } |
  \ottava 0 <c' c'>4 \tuplet 3/2 { <bf bf'>8 <af af'> \ottava -1 <bf, bf'> |
    \ottava 0 <c' c'>8 <bf bf'> <f f'> <bf bf'>4 q8 |
  }
  q4 \tuplet 5/4 { <bf' af' d>4 <ef,, ef'>16[( |
                   
    \barNumberCheck 25
    c''16 bf af' f]  ef[ c' bf af' f])  \voiceFour \beamPositionsF ef,,[( |
    c'16 bf bf' af]  ef[ c' bf f' bf,])  ef,,[( |
    c'16 bf c' af]  ef[ c' bf af' f])  ef,,[( |
    f'16 bf, d' af]  ef[ c' bf af' f])  \oneVoice <ef,,, ef'>[(
    ef''16 bf af' f]  ef[ df' bf af' f])  \beamPositionsG ef,,[( |
    ef'16 af, c' af]  ef[ ef' c af' ef])  ef,,[( |
    cf'16 bf af' d,]  ef[ cf' bf af' d,])  ef,,[( |
    cf'16 bf g' ef]  ef[ cf' bf g' ef])  <ef,,, ef'>[( |
    
    \barNumberCheck 33
    ef''16 bf af' f]  ef[ df' bf af' f])  \beamPositionsH ef,,[( |
    ef'16 af, c' af]  ef[ ef' c af' ef])  ef,,[( |
    cf'16 bf af' d,]  ef[ cf' bf af' d,])  ef,,[( |
    cf'16 bf g' ef]  ef[ cf' bf g' ef])  ef,,[( |
    cf'16 bf af' d,])  ef,[( cf' bf af' d,])  \beamPositionsI ef,[( |
    cf'16 bf g' ef])  ef,[( cf' bf af' d,])  ef,[( |
    cf'16 bf g' ef])  ef,[( cf' bf g' ef])  ef,[( |
    cf'16 bf g' ef])  \beamPositionsJ ef,[( cf' bf g' ef g]) |
  }
  <bf, g' ef'>2 |
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
  \override DynamicTextSpanner.style = #'none
  \partial 16 * 4/5 s16 * 4/5 \p 
  s2\f |
  s4 s\< <>\! |
  s2\cresc |
  s2\cresc |
  s4\sf s\> <>\! |
  s4.\> s8\! |
  s2\> <>\! |
  s2 |
  
  \barNumberCheck 9
  s2\pp |
  s2\< <>\! |
  s2 * 6 |
  
  \barNumberCheck 17
  s2 * 3 |
  s4.. s16\cresc |
  s2 |
  s2\cresc |
  s2 * 2 |
  
  \barNumberCheck 25
  s2\ff |
}

% MIDI only
pedal = {
  \partial 16 * 4/5 s16 * 4/5 \sd
  \tuplet 5/4 { 
    \repeat unfold 4 { s4 s16 s4 s16\su\sd | }
    \repeat unfold 4 { s4 s16\su\sd s4 s16\su\sd | }
    
    \barNumberCheck 9
    \repeat unfold 2 { s4 s16 s4 s16\su\sd | }
    \repeat unfold 2 { s4 s16\su\sd s4 s16\su\sd | }
    \repeat unfold 2 { s4 s16 s4 s16\su\sd | }
    \repeat unfold 2 { s4 s16\su\sd s4 s16\su\sd | }
    
    \barNumberCheck 17
    \repeat unfold 8 { s4 s16\su\sd s4 s16\su\sd | }
    
    \barNumberCheck 25
    \repeat unfold 8 { s4 s16 s4 s16\su\sd | }
    
    \barNumberCheck 33
    \repeat unfold 4 { s4 s16 s4 s16\su\sd | }
    \repeat unfold 3 { s4 s16\su\sd s4 s16\su\sd | }
    s4 s16\su\sd s4 s16 |
  }
  s2\su\sd
}

tempi = {
  \textMark \markup \tempo-markup Affettuoso #2 #0 88
  \set Score.tempoHideNote = ##t
  \tempo 4 = 60
  \partial 16 * 4/5 s16 * 4/5
  s2 * 8 |
  
  \barNumberCheck 9
  s2 * 8 |
  
  \barNumberCheck 17
  s2 * 3
  \tuplet 5/4 { s4 16 s4 \tempo 4 = 69 s16 }
  s2 * 3 |
  \tuplet 5/4 { s4 16 s4 \tempo 4 = 60 s16 }
  
  \barNumberCheck 25
  s2 * 8 |
  
  \barNumberCheck 33
  s2 * 5 |
  \tempo 4 = 63 s4 \tempo 4 = 66 s4 |
  \tempo 4 = 69 s4 \tempo 4 = 72 s4 |
  \tempo 4 = 76 s4 \tempo 4 = 80 s4 |
}

forceBreaks = {
  \partial 16 * 4/5 s16 * 4/5
  s2 * 2 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 2 s2 \break
  s2 * 2 s2 \pageBreak
  
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
  s2 * 3 s2 \break
}

preludeNineteenNotes =
\score {
  \header {
    title = "19."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 19"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \override Beam.breakable = ##t
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeNineteenMidi =
\book {
  \bookOutputName "prelude-op11-no19"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal \tempi >>
      \new Staff = "lower" << \leftHand \dynamics \pedal \tempi >>
    >>
    \midi {}
  }
}
