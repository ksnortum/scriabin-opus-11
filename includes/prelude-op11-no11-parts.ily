%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

beamPositionsA = \tweak Beam.positions #'(-5 . -3) \etc
beamPositionsB = \tweak Beam.positions #'(-4.5 . -2.5) \etc
beamPositionsC = \tweak Beam.positions #'(-6.5 . -3.5) \etc
beamPositionsD = \tweak Beam.positions #'(-6 . -3) \etc
beamPositionsE = \tweak Beam.positions #'(-5.5 . -3) \etc
beamPositionsF = \tweak Beam.positions #'(-6 . -4) \etc
beamPositionsG = \tweak Beam.positions #'(-5.5 . -4) \etc
beamPositionsH = \tweak Beam.positions #'(-5 . -3.5) \etc
beamPositionsI = \tweak Beam.positions #'(-4.5 . -3.5) \etc
beamPositionsJ = \tweak Beam.positions #'(-4 . -3) \etc

moveHairpinA = \tweak Hairpin.Y-offset -5.25 \etc
moveTextA = \tweak Y-offset 4 \etc

%% Music %%%

global = {
  \time 6/8
  \key b \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \textMark \markup \tempo-markup "Allegro assai" #3 #0 126
  \set Score.tempoHideNote = ##t
  \tempo 8 = 160
  \voiceOne ds''4.~ \after 32 \< ds8 ds \after 16 \! cs |
  \oneVoice <g b e>2.-> |
  \voiceOne fs'4.~ \after 32 \< fs8 fs \after 16 \! e |
  \oneVoice <e, b' e g>2.-> |
  \voiceOne g'8 ds cs~ cs b cs |
  fss8 ds cs~ cs b ds |
  s4 ds8 fs e ds |
  \after 32 \> ds4. cs\! |
  
  \barNumberCheck 9
  ds4.~ \after 32 \< ds8 ds \after 16 \! cs |
  \oneVoice <g b e>2.-> |
  \voiceOne fs'4.~ \after 32 \< fs8 fs \after 16 \! e |
  \oneVoice <e, b' e g>2.-> |
  \voiceOne g'8 ds cs~ cs b cs |
  \oneVoice <cs, b' g'>4. <ds b' fs'> |
  \voiceOne b''8 e, ds~ ds fss gs |
  \oneVoice <fs, ds' b'>4. <fs ds' as'> |
  
  \barNumberCheck 17
  \voiceOne fs'4( fs8~ fs gs16 fs b,16. as32 |
  \oneVoice \tuplet 4/3 { ds'8 cs es, fs } 
    \textInsideSlur as16-\moveTextA^\rubato gs bs, cs es fs |
  \voiceOne gs4 gs8~ gs as16 gs cs,16. bs32 |
  \oneVoice \tuplet 4/3 { es'8 ds fss, gs }  bs16 as css, ds fss gs |
  \voiceOne b4 b8~ b4 b8~ |
  b8 as^\rit gs fs e ds |
  e4 b8 ds4.~ |
  ds4 cs8 gs'4 fs8) |
  
  \barNumberCheck 25
  cs4.( ds~ |
  ds4 cs8 ds4 e8 |
  <as, gs'>4. <cs as'> |
  as'4. b8 fs ds) |
  cs4.( ds~ 
  ds4 cs8 ds4 e8 |
  <as, gs'>4. <cs as'> |
  as'4. b4 fs8 |
  
  \barNumberCheck 33
  <as, gs'>4. <cs as'> |
  as'4. b4 fs8 |
  gs4. b~ |
  b4. cs |
  cs2. |
  ds4) \oneVoice r8 \clef bass <ds,,, fs b ds>4. |
  q2. |
  \bar "|."
}

rightHandLower = \relative {
  \voiceTwo r4 fs'8 e4. |
  s2. |
  fs8 b a  g4. |
  s2. |
  g4. g |
  fss4. gs |
  <gs~ b e gs>4 gs8 as gs fs |
  fs2. |
  
  \barNumberCheck 9
  r4 fs8 e4. |
  s2. |
  fs8 b a  g4. |
  s2. |
  g4. g |
  s2. |
  b4. b |
  s2. |
  
  \barNumberCheck 17
  <fs cs' e>4. <fs b e> |
  s2. |
  <gs ds' fs>4. <gs cs fs> |
  s2. |
  <gs css>4. q |
  <fs ds'>4. <fs b> |
  <gs b>4. <e b'> |
  q4. <e as> |
  
  \barNumberCheck 25
  <ds a'>2. |
  <e gs>2. |
  e2. |
  <fs ds' fs>2. |
  <<
    { a8 b a gs4 fs8 }
    \new Voice { \voiceThree ds2. }
  >>
  <e~ gs>4. e |
  e2. |
  <fs ds' fs>2. |
  
  \barNumberCheck 33
  e2. |
  <fs ds' fs>2. |
  <e b'>4. <gs e'> |
  q2. |
  <b fs' b>2. |
  q4
}

rightHand = {
  \global
  <<
    \new Voice \rightHandUpper
    \new Voice \rightHandLower
  >>
}

leftHandUpper = \relative {
  \voiceThree s8 b-.( ds-.) s b-.( e-.) |
  s8 b-.( e-. b'-. e,-. b-.) |  
  s8 b-.( fs'-.) s b,-.( g'-.) |
  s8 b,-.( e-. b'-. e,-. b-.) |
  s8 b-.( ds-.) s cs-.( b-.) |
  s8 b-.( ds-.) s ds-.( b-.) |
  s8 b-.( e-. b'-. e,-. b-.) |
  s8 b-.( fs'-.) s as,-.( fs'-.) |
  
  \barNumberCheck 9
  s8 b,-.( ds-.) s b-.( e-.) |
  s8 b-.( e-. b'-. e,-. b-.) |
  s8 b-.( fs'-.) s b,-.( g'-.) |
  s8 b,-.( e-. b'-. e,-. b-.) |
  s8 b-.( ds-.) s cs-.( b-.) |
  s8 cs-.( b-.) s b-.( fs'-.) |
  s8 cs-.( ds-.) s e-.( ds-.) |
  s8 fs-.( ds-.) s fs-.( ds-.) |
  
  \barNumberCheck 17
  s2. * 8 |
  
  \barNumberCheck 25
  s4. a8 ds a' |
  s4. gs,8 b gs' |
  s2. * 2 |
  s4. a,8 ds a' |
  s4. gs,8 b gs' |
  s2. * 2 |
  
  \barNumberCheck 33
}

leftHandLower = \relative {
  \override Slur.details.region-size = 10
  \voiceFour \beamPositionsA <fs, fs'>16 b b' fs ds' fs,
    \beamPositionsB <g, g'> b b' e, e' e, |
  \beamPositionsC <cs, cs'>16\< g'' b cs, e' g,\!
    b'-\moveHairpinA \> b, e g, b b,\! |
  \beamPositionsD <ds,ds'>16 b' b' fs fs' b,
    \beamPositionsE <e,, e'> b' b' e, g' b, |
  \beamPositionsC <cs,, cs'>16\< g'' b cs, e' g,\!
    b'-\moveHairpinA \> b, e g, b b,\! |
  \beamPositionsF <ds, ds'>16 b' b' g ds' ds,
    \beamPositionsG <e, e'> b' cs' g b b, |
  \beamPositionsF <ds, ds'>16 b' b' fss ds' ds,
    \beamPositionsG <e, e'> b' ds' gs, b ds, |
  \beamPositionsC <cs, cs'>16\< gs' b' e, e' b\!
    b'-\moveHairpinA \> b, e gs, b e,\! |
  <fs, fs'>16 e' b' gs fs' cs,  <fs, fs'> e' as fs fs' cs, |
  
  \barNumberCheck 9
  \beamPositionsH <fs, fs'>16 b b' fs ds' fs,
    \beamPositionsI <g, g'> b b' e, e' e, |
  \beamPositionsC <cs, cs'>16\< g'' b cs, e' g,\!
    b'-\moveHairpinA \> b, e g, b b,\! |
  \beamPositionsF <ds,ds'>16 b' b' fs fs' b,
    \beamPositionsG <e,, e'> b' b' e, g' b, |
  \beamPositionsC <cs,, cs'>16\< g'' b cs, e' g,\!
    b'-\moveHairpinA \> b, e g, b b,\! |
  \beamPositionsF <ds, ds'>16 b' b' g ds' ds,
    \beamPositionsG <e, e'> b' cs' g b b, |
  <es, es'>16 cs' cs' g b b,  \beamPositionsH <fs fs'> ds' b' fs fs' b, |
  \beamPositionsH <fss, fss'>16 ds' cs' b ds ds,
    \beamPositionsI <gs,! gs'> ds' e' b ds ds, |
  \beamPositionsI <gss, gss'> fs' fs' b, ds fs,
    \beamPositionsJ <as, as'> fs' fs' as, ds fs,32 r |
  
  \barNumberCheck 17
  \oneVoice as,16( fs' e' cs fs fs,)  b,( fs' e' b fs' fs,) |
  cs16( fs e' as, as' e)  e,( as fs' cs cs' fs,) |
  bs,,16( gs' fs' ds gs gs,)  cs,( gs' fs' cs gs' gs,) |
  ds16( gs fs' bs, bs' fs)  fs,( bs gs' ds ds' gs,) |
  \clef treble e,16( b' gs' css, css' gs)  es,( b' gs' css, css' gs) |
  fs,16( b fs' ds ds' b)  gs,( b' ds, \clef bass gs, ds gs,) |
  cs,16( gs' e' b' cs gs'  gs cs, b e, b' cs,) |
  fs,16( e' b' e, gs' cs,,)  fs,( e' as fs fs' fs,,) |
  
  \barNumberCheck 25
  b,16 fs' ds' a' cs b  \voiceFour a b, ds' fs, a' a, |
  \oneVoice b,,16 e e' gs cs b  \voiceFour gs b, b' gs gs' b, |
  \oneVoice b,,16( fs' e' gs ds' cs  e as, cs, fs, gs fs) |
  b,16( fs' ds' gs ds' fs, \clef treble ds'' fs, ds \clef bass fs, b, fs) |
  b,16 fs' ds' a' cs b  \voiceFour a b, ds' fs, a' a, |
  b,,16 e e' gs cs b  \voiceFour gs b, b' gs gs' b, |
  \oneVoice b,,16( fs' e' gs ds' cs  e as, cs, fs, gs fs) |
  b,16( fs' ds' gs ds' fs, \clef treble ds'' fs, ds \clef bass fs, b, fs) |
  
  \barNumberCheck 33
  b,16( fs' e' gs ds' cs  e as, cs, fs, gs fs) |
  b,16( fs' ds' gs ds' fs, \clef treble ds'' fs, ds \clef bass fs, b, fs) |
  b,16( fs' e' gs ds' cs  e b cs, fs, gs fs) |
  b,16( fs' e' gs ds' cs  e b cs, fs, gs fs) |
  b,16( fs' fs' b, fs' fs' \clef treble b, fs' b fs b fs') |
  r4 r8 \clef bass <b,,,, fs' b>4. |
  q2. |
}

leftHand = {
  \global
  \clef bass
  <<
    \new Voice \leftHandUpper
    \new Voice \leftHandLower
  >>
}

dynamics = {
  \override DynamicTextSpanner.style = #'none
  \override TextScript.Y-offset = -0.5
  s2.-\tweak Y-offset -7 \p |
  s2. * 3 |
  s2.\mf |
  s4. s\dim |
  s2.\p |
  s2. |
  
  \barNumberCheck 9
  s2.\p |
  s2. * 3 |
  s2.\cresc |
  s2. |
  s2.\cresc |
  s2.\f\cresc |
  
  \barNumberCheck 17
  s2.-\tweak X-offset 0 \pp |
  s2.\cresc |
  s2. * 2 |
  s2.^\crescConPassione |
  s2. |
  s2.\f |
  s2.\dim |
  
  \barNumberCheck 25
  s2.\p |
  s2. * 2 |
  s4. s4\> s16 s\! |
  s2.\pp |
  s2. * 3 |
  
  \barNumberCheck 33
  s2. * 2 |
  s2.\ppp |
}

% MIDI only
pedal = {
  s4.\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  
  \barNumberCheck 9
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  s2.\su\sd |
  \repeat unfold 4 { s4.\su\sd s\su\sd | }
  
  \barNumberCheck 17
  \repeat unfold 6 { s4.\su\sd s\su\sd | }
  s2.\su\sd |
  s4.\su\sd s\su\sd |
  
  \barNumberCheck 25
  \repeat unfold 8 { s2.\su\sd | }
  
  \barNumberCheck 33
  \repeat unfold 5 { s2.\su\sd | }
  s4\su\sd s8\su s4.\sd |
  s2. |  
}

preludeElevenNotes =
\score {
  \header {
    title = "11."
    composer = "Alexander Sciabin"
    opus = "Opus 11, No. 11"
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

preludeElevenMidi =
\book {
  \bookOutputName "prelude-op11-no11"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {}
  }
}
