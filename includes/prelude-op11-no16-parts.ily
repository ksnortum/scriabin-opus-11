%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

moveTextA = \tweak X-offset -2 \etc

beamPositionsA = \once \override Beam.positions = #'(-3.5 . -4.5)
beamPositionsB = \once \override Beam.positions = #'(-3.5 . -4.5)
beamPositionsC = \once \override Beam.positions = #'(-3.5 . -4)

forceHShiftA = \once \override NoteColumn.force-hshift = 1.6

%% Music %%%

global = {
  \key bf \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup Misterioso #3 #0 160-168
  \set Score.tempoHideNote = ##t
  \tempo 8 = 160
  \voiceOne
  \partial 8 r8-\moveTextA ^\sottoVoce
  bf4.-- bf8.-- bf16-- |
  bf4.-- r8 |
  df4. df8. df16 |
  df4. r8 |
  f4.~ f8 r |
  e4.~ e8 r |
  f4. r4 |
  s2 |
  
  \barNumberCheck 9
  f4. f8. f16 |
  f4. r8 |
  af4. af8. af16 |
  af4. r8 |
  gf4.~ gf8 r |
  f4.~ f8 r |
  af4. r8 r |
  s2 |
  
  \barNumberCheck 17
  df4. df8. df 16 |
  df4. df4 |
  cf4.~ cf4~ |
  cf4. r8 |
  cf4. cf8. cf16 |
  cf4. cf4 |
  bf4.~ bf4 |
  f4. r8 |
  
  \barNumberCheck 25
  bf4. bf8. bf16 |
  bf4.~ bf8 r |
  c4. c8. c16 |
  c4.~ c8 r |
  \repeat unfold 4 { s4. s4 | }
  
  \barNumberCheck 33
  <bf, bf'>4. q8. q16 |
  q4. r8 |
  <df df'>4. q8. q16 |
  q4. r8 |
  <f_~ f'^~>4. q8 r |
  <f_~ f'^~>4. q8 r |
  <gf_~ gf'^~>4. q8 s |
  R2 |
  
  \barNumberCheck 41
  gf4. gf8. gf16 |
  gf4. r8 |
  gf4. gf8. gf16 |
  gf4. r8 |
  f4.~ f4~ |
  f4. r8 |
  f4.~ f4 |
  \clef bass a,4. r8 |
  
  \barNumberCheck 49
  bf4. bf8. bf16 |
  bf4. bf8. bf16 |
  bf4. df8. df16 |
  df4. s4 |
  s2 |
}

rightHandLower = \relative {
  \voiceTwo 
  \partial 8 \tuplet 3/2 { bf,16( c ef } 
  bf'8[ af ef gf df] |
  f8[ c df]) \tuplet 3/2 { bf16( df gf } |
  df'8[ c gf bf f] |
  gf8[ ef df]) \tuplet 3/2 { df16( gf bf } |
  f'8[ ef bf df]) \tuplet 3/2 { c,16( gf' bf } |
  e8[ df bf c]) \clef treble \tuplet 3/2 { f,16( a df } |
  f8[ ef c df bf] |
  \oneVoice c8[ gf f]) \omit TupletNumber \tuplet 3/2 { f16_( g bf } |
  
  \barNumberCheck 9
  \voiceTwo f'8[ ef bf df af] |
  c8[ g af]) \tuplet 3/2 { d,16( bf' f' } |
  af8[ gf! f af bf,] |
  cf8[ af bf]) \tuplet 3/2 { ef,16( bf' ef } |
  gf8[ f df ef]) \tuplet 3/2 { af,16( bf c } |
  f8[ df bf c]) \tuplet 3/2 { df,16( af' df } |
  af'8[ gf ef f af] |
  \oneVoice df8[ f, af,]) \tuplet 3/2 { bf16_( df gf } |
  
  \barNumberCheck 17
  \voiceTwo df'8[ c gf bf df,] |
  df'8[ c gf bf] \tuplet 3/2 { bf,16 ef gf } |
  cf8[ bf f af ef] |
  gf8[ f ef]) \tuplet 3/2 { af,16( cf ff } |
  cf'8[ bf ff af cf,] |
  cf'8[ bf ff af] \tuplet 3/2 { af,16 d f } |
  bf8[ af f gf ef] |
  f8[ cf bf]) \tuplet 3/2 { gf16( bf ef } |
  
  \barNumberCheck 25
  bf'8[ f d ef bf] |
  bf'8[ f d ef]) \tuplet 3/2 { gf,16( c e } |
  c'8[ gf ef e c] |
  c'8[ gf ef e]) \tuplet 3/2 { f,16( a df } |
  \oneVoice f8[ g,-. a-. gf-. af]-. |
  g8[-. a-. b-. af-. bf]-. |
  a8[-. cf-. df-. a-. cf]-. |
  df8[-. a-. cf-. df])-. \voiceTwo \tuplet 3/2 { bf16( c ef } |
  
  \barNumberCheck 33
  bf'8[ af ef gf df] |
  f8[ c df]) \tuplet 3/2 { bf16( df gf } |
  df'8[ c gf bf f] |
  gf8[ ef df] \tuplet 3/2 { df16 gf bf } |
  \beamPositionsA f'8[ ef bf df]) \tuplet 3/2 { d,16( af' cf }  |
  \beamPositionsB f8[ df bf cf]) \tuplet 3/2 { ef,16( gf cf } |
  \beamPositionsC gf'8[-> f cf ef bf] |
  cf8[ af gf]) \tuplet 3/2 { ef,16( gf cf } |
  
  \barNumberCheck 41
  gf'8[ f cf ef bf] |
  df8[ gf, ff]) \tuplet 3/2 { ef16( gf cf } |
  gf'8[ f cf ef bf] |
  df8[ gf, e]) \tuplet 3/2 { f16( bf c } |
  f8[ c a bf c] |
  ef8[ c bf]) \tuplet 3/2 { f16( a df } |
  f8[ ef a, ef' df] |
  \clef bass a8[ gf f]) \tuplet 3/2 { bf,16( c ef } |
  
  \barNumberCheck 49
  bf'8[ af ef gf df] |
  f8[ c df gf df] |
  f8[ c df bf' f] |
  gf8[ ef df] \oneVoice <f bf f'>8. q16 |
  q2)\fermata |
  \bar "|."
}

rightHand = {
  \global
  \clef bass
  \mergeDifferentlyDottedOn
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \voiceThree 
  \partial 8 r8
  bf,4.-- bf8.-- bf16-- |
  bf4.-- r8 |
  df4. df8. df16 |
  df4. r8 |
  f4.~ f8 r |
  e4.~ e8 r |
  f4. r4 |
  s2 |
  
  \barNumberCheck 9
  f4. f8. f16 |
  f4. r8 |
  af4. af8. af16 |
  af4. r8 |
  gf4.~ gf8 r |
  f4.~ f8 r |
  af4. r8 r |
  s2 |
  
  \barNumberCheck 17
  df4. df8. df 16 |
  df4. df4 |
  cf4.~ cf4~ |
  cf4. r8 |
  cf4. cf8. cf16 |
  cf4. cf4 |
  bf4.~ bf4 |
  f4. r8 |
  
  \barNumberCheck 25
  bf4. bf8. bf16 |
  bf4.~ bf8 r |
  c4. c8. c16 |
  c4.~ c8 r |
  \repeat unfold 4 { s4. s4 | }
  
  \barNumberCheck 33
  \repeat unfold 2 { s4. s4 | s2 | }
  \repeat unfold 3 { s4. s4 | }
  s2 |
  
  \barNumberCheck 41
  gf4. gf8. gf16 |
  gf4. r8 |
  gf4. gf8. gf16 |
  gf4. r8 |
  f4.~ f4~ |
  \forceHShiftA f4. r8 |
  f4.~ f4 |
  a,4. r8 |
  
  \barNumberCheck 49
  bf4. bf8. bf16 |
  bf4. bf8. bf16 |
  bf4. df8. df16 |
  df4. s4 |
  s2 |
}

leftHandLower = \relative {
  \voiceFour
  \partial 8 \tuplet 3/2 { bf,,16(\unaCorda c ef } 
  bf'8[ af ef gf df] |
  f8[ c df]) \tuplet 3/2 { bf16( df gf } |
  df'8[ c gf bf f] |
  gf8[ ef df]) \tuplet 3/2 { df16( gf bf } |
  f'8[ ef bf df]) \tuplet 3/2 { c,16( gf' bf } |
  e8[ df bf c]) \tuplet 3/2 { f,16( a df } |
  f8[ ef c df bf] |
  \oneVoice c8[ gf f]) \omit TupletNumber \tuplet 3/2 { f16_( g bf } |
  
  \barNumberCheck 9
  \voiceFour f'8[ ef bf df af] |
  c8[ g af]) \tuplet 3/2 { d,16( bf' f' } |
  af8[ gf f af bf,] |
  cf8[ af bf]) \tuplet 3/2 { ef,16( bf' ef } |
  gf8[ f df ef]) \tuplet 3/2 { af,16( bf c } |
  f8[ df bf c]) \tuplet 3/2 { df,16( af' df } |
  af'8[ gf ef f af] |
  \oneVoice df8[ f, af,]) \tuplet 3/2 { bf16_( df gf } |
  
  \barNumberCheck 17
  \voiceFour df'8[ c gf bf df,] |
  df'8[ c gf bf] \tuplet 3/2 { bf,16 ef gf } |
  cf8[ bf f af ef] |
  gf8[ f ef]) \tuplet 3/2 { af,16( cf ff } |
  cf'8[ bf ff af cf,] |
  cf'8[ bf ff af] \tuplet 3/2 { af,16 d f } |
  bf8[ af f gf ef] |
  f8[ cf bf]) \tuplet 3/2 { gf16( bf ef } |
  
  \barNumberCheck 25
  bf'8[ f d ef bf] |
  bf'8[ f d ef]) \tuplet 3/2 { gf,16( c e } |
  c'8[ gf ef e c] |
  c'8[ gf ef e]) \tuplet 3/2 { f,16( a df } |
  \oneVoice <f, f'>8[ <g, g'>-. <a a'>-. <gf gf'>-. <af af'>]-. |
  <g g'>8[-. <a a'>-. <b b'>-. <af af'>-. <bf bf'>]-. |
  <a a'>8[-. <cf cf'>-. <df df'>-. <a a'>-. <cf cf'>]-. |
  <df df'>8[-. <a a'>-. <cf cf'>-. <df df'>])-. 
    \tuplet 3/2 { <bf bf'>16(\unaCorda c' ef } |
  
  \barNumberCheck 33
  <bf bf'>8[ <af af'> <ef ef'> <gf gf'> <df df'>] |
  <f f'>8[ <c c'> <df df'>]) \tuplet 3/2 { <bf bf'>16( df' gf } |
  <df df'>8[ <c c'> <gf gf'> <bf bf'> <f f'>] |
  <gf gf'>8[ <ef ef'> <df df'>]) \tuplet 3/2 { q16( gf' bf } |
  <f f'>8[ <ef ef'> <bf bf'> <df df'>]) \tuplet 3/2 { <d, d'>16( af'' cf } |
  <f, f'>8[ <df df'> <bf bf'> <cf cf'>]) 
    \tuplet 3/2 { <ef, ef'>16(\treCorde gf' cf } |
  <gf gf'>8[ <f f'> <cf cf'> <ef ef'> <bf bf'>] |
  <cf cf'>8[ <af af'> <gf gf'>]) \tuplet 3/2 { ef16_( gf cf } |
  
  \barNumberCheck 41
  \voiceFour gf'8[ f cf ef bf] |
  df8[ gf, ff]) \tuplet 3/2 { ef16( gf cf } |
  gf'8[ f cf ef bf] |
  df8[ gf, e]) \tuplet 3/2 { f16( bf c } |
  f8[ c a bf c] |
  ef8[ c bf]) \tuplet 3/2 { f16( a df } |
  f8[ ef a, ef' df] |
  \clef bass a8[ gf f]) \tuplet 3/2 { bf,16( c ef } |
  
  \barNumberCheck 49
  bf'8[ af ef gf df] |
  f8[ c df gf df] |
  f8[ c df bf' f] |
  gf8[ ef df] \oneVoice <bf f' bf>8. q16 |
  q2)\fermata |
}

leftHand = {
  \global
  \clef bass
  \mergeDifferentlyDottedOn
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 8 s8\p 
  s4. s4 |
  s2 |
  s4. s4 |
  s2 |
  s4.\cresc s4 |
  s4. s4 |
  s4.\dim s4 |
  s4. s8\p |
  
  \barNumberCheck 9
  \repeat unfold 2 { s4. s4 | s2 | }
  \repeat unfold 3 { s4. s4 | }
  s2 |
  
  \barNumberCheck 17
  s2 s8\cresc |
  s4. s4 |
  s4. s4 |
  s4. s8\pp |
  \repeat unfold 3 { s4. s4 | }
  s2 |
  
  \barNumberCheck 25
  s4.\cresc s4 |
  s4. s4 |
  s4. s4 |
  s2 s8\mf |
  s8 s2\cresc |
  \repeat unfold 3 { s4. s4 | }
  
  \barNumberCheck 33
  s4.\ff s4 |
  s2 |
  s4. s4 |
  s2 |
  s8\cresc s2 |
  s2 s8\ff |
  s4. s4 |
  s4. s8\p |
  
  \barNumberCheck 41
  s8 s8.\< s16\! s4 |
  s4\> s\! |
  s8 s4\< s8\! s |
  s4\> s8\! s\dim | 
  s4. s8\< s\! |
  s8\> s\! s4 |
  s4. s4 | 
  s2 |
  
  \barNumberCheck 49
  s4.-\tweak X-offset 0 \pp s4 |
  s4. s4 |
  s4. s4 |
  s4. s8. s16\ppp |
  s2 |
}

timeSignatures = {
  \override Score.TimeSignature.stencil = 
    #(time-alternate-time "5" "8" "4" "8")
  \time 5/8
  \partial 8 s8
  \override Score.TimeSignature.stencil = ##f
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  s4. s4 |
  s4. s4 |
  \time 4/8 s2 |
  
  \barNumberCheck 9
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 |
  s4. s4 | 
  s4. s4 |
  \time 4/8 s2 |
  
  \barNumberCheck 17
  \time 5/8 s4. s4 |
  s4. s4 |
  s4. s4 | 
  \time 4/8 s2 |
  \time 5/8 s4. s4 |
  s4. s4 |
  s4. s4 |
  \time 4/8 s2 | 
  
  \barNumberCheck 25
  \time 5/8 \repeat unfold 8 { s4. s4 | }
  
  \barNumberCheck 33
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  s4. s4 | 
  s4. s4 | 
  \time 4/8 s2 | 
  
  \barNumberCheck 41
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  \time 5/8 s4. s4 | 
  \time 4/8 s2 | 
  
  \barNumberCheck 49
  \time 5/8 \repeat unfold 4 { s4. s4 | }
  \time 4/8 s2 |
}


forceBreaks = {
  \partial 8 s8
  s4. s4 | 
  s2 | 
  s4. s4 | \break
  s2 | 
  s4. s4 | 
  s4. s4 | \break
  s4. s4 |
  s2 |
  
  \barNumberCheck 9
  s4. s4 | 
  s2 | \break
  s4. s4 | 
  s2 | 
  s4. s4 |
  s4. s4 | \break
  s4. s4 |
  s2 |
  
  \barNumberCheck 17
  s4. s4 |
  s4. s4 | \pageBreak
  s4. s4 | 
  s2 |
  s4. s4 |
  s4. s4 | \break
  s4. s4 |
  s2 | 
  
  \barNumberCheck 25
  s4. s4 |
  s4. s4 | \break
  s4. s4 |
  s4. s4 |
  s4. s4 | \break
  s4. s4 |
  s4. s4 |
  s4. s4 | \break
  
  \barNumberCheck 33
  s4. s4 | 
  s2 | 
  s4. s4 | \pageBreak
  s2 | 
  s4. s4 | 
  s4. s4 | \break
  s4. s4 | 
  s2 | 
  
  \barNumberCheck 41
  s4. s4 | \break
  s2 | 
  s4. s4 | 
  s2 | 
  s4. s4 | \break
  s2 | 
  s4. s4 | 
  s2 | 
  
  \barNumberCheck 49
  s4. s4 | \break
  s4. s4 |
  s4. s4 |
  s4. s4 |
  \time 4/8 s2 |
}

preludeSixteenNotes =
\score {
  \header {
    title = "16."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 16"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \timeSignatures
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeSixteenMidi =
\book {
  \bookOutputName "prelude-op11-no16"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \timeSignatures \dynamics >>
      \new Staff = "lower" << \leftHand \timeSignatures \dynamics >>
    >>
    \midi {}
  }
}
