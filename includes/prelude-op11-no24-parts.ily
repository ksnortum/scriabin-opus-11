%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

global = {
  \key d \minor
  \accidentalStyle piano
}

rightHand = \relative {
  \global
  \textMark \markup \tempo-markup Presto #2 #0 100
  \set Score.tempoHideNote = ##t
  \tempo 4 = 120
  \partial 4 r4
  \slurUp
  <d' g a>8( q q  q q <g a d> |
  q8 <d g a> <g a d>  q <d g a> |
  <cs f a>8 q q  q q <f a cs> |
  <f cs'>8 <cs f a> <f a cs> q  <cs f a> |
  <d f a>8 q q  q q <f a d> |
  <f d'>8 <d f a> <f a d> q) r |
  <bf, d f>4.( <a cs g' a>8. <bf d g bf> |
  <c f a c>4. <cs g' a cs>8-> <d f a d>->) r |
  
  \barNumberCheck 9
  <f bf d>8( q q  q q <bf d f> |
  q8 <f bf d> <bf d f>  q <f bf d> |
  <f bf c>8 q q   <e bf' c> <e a c> <gs c e> |
  <gs e'> <e gs c> <gs c e>  q <e gs c> |
  <f a c>8 q q  q q <a c f> |
  <a f'>8 <f a c> <a c f>  q) r |
  <d, f a>4.( <c e bf' c>8. <d f bf d> |
  <e a c e>4. <e bf' c e>8-> <f a c f>->) r |
  
  \barNumberCheck 17
  <e bf' c>8( q q  q q <e a e'> |
  q8 <e a c> <e a e'>  q <e a c> |
  <ds a' b>8 q q  q q <d gs d'> |
  <d g d'> <d g bf> <d g d'>  q <d g bf> |
  <g cs g'>8 q q  q q <bf d bf'> |
  q8 <g d' g> <bf d bf'>  q <g d' g> |
  <fs bf ef fs>8 q q  q q <bf d bf'> |
  q8 <g d' g> <bf d bf'>  q <g d' g> <bf d bf'> |
  
  \barNumberCheck 25
  q8 <f d' f> <bf d bf'>  q <f d' f> <a d a'> |
  q8 <f d' f> <a d a'>  q <f d' f>) r |
  <a d g a>8( q q   q q <d g a d> |
  q8 <a d g a> <d g a d>  q <a d g a> |
  <a cs f a>8 q q  q q <cs f a cs> |
  <cs f cs'>8 <a cs f a> <cs f a cs>  q <a cs f a> |
  <a d f a>8 q q  q q <d f a d> |
  <d f d'> <a d f a> <d f a d> q4) |
  
  \barNumberCheck 33
  \omit TupletBracket
  \omit TupletNumber
  <f, bf d f>4.( \tuplet 2/3 { <a cs g' a>8 <bf d g bf> |
    q8 <c f a c> q <cs g' a cs> |
  }
  q4. <cs a' cs a'>\arpeggio |
  <d a' d a'>4.~ q4) <f, a d>8 |
  q2.\fermata |
  \bar "|."
}

leftHand = \relative {
  \global 
  \override Beam.auto-knee-gap = 7
  \clef bass
  \partial 4 <a,, a'>4
  e''8.-- a, a'-- e |
  e'8. a, e8 <a,, a'> |
  g''8.-- a, a'-- g |
  a'8.-- a, g8 <d,, d'> |
  f''8. a, a' f |
  a'8. a, f8 bf, |
  bf8( <f f'> a  <e e'> g <d d'> | 
  f8 <c c'> e  <a, a'>-> <d, d'>->) <g g'>\noBeam |
  
  \barNumberCheck 9
  bf''8. d, d' bf |
  g'8. bf, d,8 <c, c'> |
  bf''8. c, c' bf |
  c'8. c, bf8 <f,, f'>-> |
  a''8. c, c' a |
  c'8. c, a8 d,(\noBeam |
  d8 <a a'> c  <g g'> bf <f f'> |
  a8 <e e'> g  <c, c'>-> <f f'>->) <gf, gf'>\noBeam |
  
  \barNumberCheck 17
  c'8. bf' e <c,,, c'> |
  a'''8. e e'8 <f,,, f'> |
  b'8. a' ds e,, |
  <bf bf'>8. g'' d'8 bf, |
  <ef, ef'>8. <bf' bf'> <g' g'> <g,, g'> |
  <d' d'>8. <bf' bf'> <g' g'>8 g, |
  <c, c'>8. <bf' bf'> <fs' fs'> <g,, g'> |
  <d' d'>8. <bf' bf'> <g' g'> <gs,, gs'> |
  
  \barNumberCheck 25
  <f' f'>8. <d' d'> <bf' bf'> <a,, a'> |
  <f' f'>8. <d' d'> <a' a'>4 <a,, a'>8 |
  <e'' e'>8. <a, a'> <a' a'> <e e'> |
  <e' e'>8. <a, a'> <e e'>8 <a,, a'> |
  <g'' g'>8. <a, a'> <a' a'> <g g'> |
  \clef treble <a' a'> \clef bass <a, a'> <g g'>8 <d,, d'> |
  <f'' f'>8. <a, a'> <a' a'> <f f'> |
  % octave in first dotted eighth, SrcB
  \clef treble <a' a'> \clef bass <a, a'> r8 <bf, bf'> |
  
  \barNumberCheck 33
  q8 <f f'> <a a'>  q <e e'> <g g'> |
  q8 <d d'> <f f'>  q <c c'> <e e'> |
  q8 <a, a'> <e' e'>  <a a'> <e' e'> <f f'> |
  <a, a'> <f' f'> <a, a'> <d, d'> <d, d'> <d'' a' d>\noBeam |
  q2. |
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \partial 4 s4
  s2.\p |
  s4. s4 |
  s2. |
  s4. s4 |
  s2. |
  s4. s4 |
  s2. |
  s4.\dim s\f |
  
  \barNumberCheck 9
  s2.\p |
  s4. s4 |
  s4. s4 s8\< |
  s16 s\! s8\> s\! s4 |
  s2.\f |
  s4. s4 |
  s2. |
  s4.\dim s\f |
  
  \barNumberCheck 17
  s2.\p |
  s4. s4 |
  s4. s\cresc |
  s4. s4 |
  s2. |
  s4. s4 |
  s2. * 2 |
  
  \barNumberCheck 25
  s2. * 2 |
  s2.\ff |
  s4. s4 |
  s2. |
  s4. s4 |
  s2. |
  s4. s4 |
  
  \barNumberCheck 33
  s2.\fff |
  s2. * 4 |
}

% MIDI only
pedal = {
  \partial 4 s4\sd
  s2. |
  s4. s8 s\su\sd |
  s2.
  s4. s8 s\su\sd |
  s2.
  s4. s8\su s\sd |
  s4. s8.\su\sd s\su\sd |
  s4.\su\sd s4\su s8\sd |
  
  \barNumberCheck 9
  s2. |
  s4. s8 s\su\sd |
  s2. |
  s4. s8 s\su\sd |
  s2. |
  s4. s8\su s\sd |
  s4. s8.\su\sd s\su\sd |
  s4.\su\sd s4\su s8\sd |
  
  \barNumberCheck 17
  s4. s8. s\su\sd |
  s4. s8 s\su\sd |
  s2. |
  s4.\su\sd s4 |
  s4. s8. s\su\sd |
  s4. s4 |
  s4.\su\sd s8. s\su\sd |
  s4. s8. s\su\sd |
  
  \barNumberCheck 25
  s4. s8. s\su\sd |
  s4. s4 s8\su\sd |
  s2. |
  s4. s8 s\su\sd |
  s2. |
  s4. s8 s\su\sd |
  s2. |
  s4. s8 s\su\sd |
  
  \barNumberCheck 33
  s4. s8.\su\sd s\su\sd |
  s8.\su\sd s\su\sd s\su\sd s\su\sd |
  s2.\su\sd |
  s2.\su\sd |
  s2. <>\su |
}

timeSignatures = {
  \override Score.TimeSignature.stencil = 
    #(time-alternate-time "6" "8" "5" "8")
  \time 6/8
  \partial 4 s4
  \override Score.TimeSignature.stencil = ##f
  s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. * 2 |
  
  \barNumberCheck 9
  s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. * 2 |
  
  \barNumberCheck 17
  s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. * 2 |
  
  \barNumberCheck 25
  s2. * 3 |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  \time 6/8 s2. |
  \time 5/8 s4. s4 |
  
  \barNumberCheck 33
  \time 6/8 s2. * 5 |
}

forceBreaks = {
  \partial 4 s4 \noBreak
  s2. | \noBreak
  s4. s4 | \noBreak
  s2. | \noBreak
  s4. s4 | \break
  s2. | \noBreak
  s4. s4 | \noBreak
  s2. | \noBreak
  s2. | \break
  
  \barNumberCheck 9
  s2. | \noBreak
  s4. s4 | \noBreak
  s2. | \noBreak
  s4. s4 | \break 
  s2. | \noBreak
  s4. s4 | \noBreak
  s2. | \noBreak
  s2. | \pageBreak
  
  \barNumberCheck 17
  s2. |
  s4. s4 |
  s2. |
  s4. s4 | \break
  s2. |
  s4. s4 |
  s2. * 2 | \break
  
  \barNumberCheck 25
  s2. * 3 |
  s4. s4 |\break
  s2. |
  s4. s4 |
  s2. |
  s4. s4 | \break
  
  \barNumberCheck 33
  s2. * 5 |
}

preludeTwentyFourNotes =
\score {
  \header {
    title = "24."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 24"
  }
  \keepWithTag layout  
  \new PianoStaff \with {
    \override StaffGrouper.staff-staff-spacing.padding = 5
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \timeSignatures
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeTwentyFourMidi =
\book {
  \bookOutputName "prelude-op11-no24"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \timeSignatures \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \timeSignatures \dynamics \pedal >>
    >>
    \midi {}
  }
}
