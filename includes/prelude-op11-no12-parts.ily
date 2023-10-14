%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"
\language "english"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 3) (0 . -3.5) (0 . -3.5) (0 . 0)) \etc

hShiftA = \tweak NoteColumn.force-hshift -0.25 \etc

moveHairpinAOn = \override Hairpin.Y-offset = 1.5
moveHairpinAOff = \revert Hairpin.Y-offset

%% Music %%%

global = {
  \time 9/8
  \key gs \minor
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \set Staff.tieWaitForNote = ##t
  \partial 8 * 5 gs'8^( as ds ds,~ b'_~ 
  <ds, b' fs'>4.) r8 gs^( as ds ds, b'~ |
  <cs, b' e>4.) r8 gs'^( as cs e, b' |
  as8 b cs, b' gs as b e,~ gs_~ |
  <e gs ds'>4.) r8 gs^( as cs e, b'~ |
  <ds, b' fs'>4.) r8 gs^( as ds ds,~ b'_~ |
  <ds, b' es>4.) r8 es( b' ds ds, b' |
  as b ds, b' ds, es gs css, fs |
  ds'4.) r4 r8 r4 r8 |
  
  \barNumberCheck 9
  r8. <fs, as>-\slurShapeA ( <es ds'>[ <fs cs'>~ <fs cs' ds> <cs b' es>] |
  \voiceOne <cs fs'>4. \voiceTwo as'8) \oneVoice r r r4 r8 |
  r8. <a cs>([ <gs fs'> <a e'>~ <a e' a> <a ds b'>] |
  <gs e' b'>4.) r8 fs'( e b e, as |
  cs,8 gs' ds' cs e ds fs, b, gs' |
  gs, d' cs' b as gs css, as b |
  gs8 b fs' e\noBeam <fss, ds'> <gs b> <fss ds'> <ds' as'> <b gs'> |
  <fss ds'>4 <gs b>8) \tuplet 4/3 { r gs''(\fermata fs e } b e, as |
  
  \barNumberCheck 17
  cs,8 gs' ds' \tuplet 4/3 { cs fs\fermata e ds } fs, b, gs' |
  gs,8 d' cs' \tuplet 4/3 { b b_\fermata as gs } css, as b |
  gs8 b fs' e\noBeam <fss, ds'> <gs b> <fss ds'> <ds' as'> <b gs'> |
  <fss ds'>4 <gs b>8) r <fss ds'>( <gs b> <fss ds'> <ds' as'> <b gs'> |
  <fss ds'>4 <b gs>8 <fss ds'>4 <b gs>8 <fss ds'>4 <b gs>8 |
  <ds, gs ds'>2.)\fermata r4 r8 |
  \bar "|."
}

rightHandLower = \relative {
  \partial 8 * 5 \voiceTwo s4 s8 ds'4 
  s2. s8 ds4 |
  s2. s4. |
  s2. s8 e4 |
  s2. s8 e4 |
  s2. s8 ds4 |
  \repeat unfold 3 { s2. s4. | }
  
  \barNumberCheck 9
  s2. s4. |
  \hShiftA b'4. s2. |
  \repeat unfold 4 { s2. s4. | }
  gs,4.~ gs8 s4 s4. |
  s2. s4. |
  
  \barNumberCheck 17
  s2. s4. |
  s2. s4. |
  gs4.~ gs8 s4 s4. |
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
  \clef bass
  \partial 8 * 5 r8 r r4 r8
  <gs,, gs'>8( ds'' b' fs') r r r4 r8 |
  <gs,,, gs'>8( cs' b' e) r r r4 r8 |
  gs,,8( e' b' gs') r r r4 r8 |
  <gs,,, gs'>8( cs' b' gs' cs, e, gs,4) r8 |
  <gs, gs'>8 ds'' b' fs' r r r4 r8 |
  <gss,,, gss'>8( es'' b' ds) r r r4 r8 |
  <as,, as'>8( fs'' gs ds' b es, as, fs' as, |
  ds,8 b' fs' gs)\noBeam ds( es as as, fs' |
  
  \barNumberCheck 9
  cs'8.[ bs b as gs g] |
  fs8. cs' cs'8)\noBeam fs,,( gs cs cs, a' |
  e'8.[ ds d cs fs, b] |
  e,8. b' \tuplet 4/3 { gs'8) e,,( b' gs' } d' gs) e,,( |
  as8 gs' cs \tuplet 4/3 { gs') e,,( b' fs' } a ds) e,,( |
  b'8. gs' d') e,,( as8 gs') ds,( |
  b'8 e b b')\noBeam <ds,, as'>( <gs e'> <ds as'> q <gs e'> |
  % In both sources, the sixteenth notes are triplets, but the measure
  % is not full if that is so.  I decided to leave them as non-triplets.
  <ds as'>4 <gs ds'>8 gs,8.)\noBeam e'16^( b' gs' d'8 gs) e,,( |
  
  \barNumberCheck 17
  % See note on sixteenth note triplets above.
  as gs' cs gs'8.) e,,16( b' fs' a8 ds) e,,( |
  b'8. gs' d') e,,( as8 gs') ds,( |
  b'8 e b b')\noBeam <ds,, as'>( <gs e'> <ds as'> q <gs e'> |
  <ds as'>4 <gs ds'>8 gs,)\noBeam <ds' as'>( <gs e'> <ds as'> q <gs e'> |
  <ds as'>4 <gs e'>8 <ds as'>4 <gs e'>8 <ds as'>4 <gs e'>8 |
  <gs, ds' gs>2.)\fermata r4 r8 |
}

dynamics = {
  \partial 8 * 5 \tag layout { s4^\ppSotoVoce } 
                 \tag midi { s4\pp } s4.
  \repeat unfold 8 { s2. s4. | }
  
  \barNumberCheck 9
  s2. s4. |
  s2. s4 s8\< |
  s8 s4\! s2. |
  s2. s8 \moveHairpinAOn s\< s\! |
  s4.\> s\! \moveHairpinAOff s4\< s8\! |
  s4.\> s2.\! |
  s4. s8 s4\pp s4. |
  s2. s4. |
  
  \barNumberCheck 17
  s2. s4. |
  s2. s4. |
  s4. s8 s4\pp s4. |
}

tempi = {
  \textMark \markup \tempo-markup Andante #3 #0 126
  \set Score.tempoHideNote = ##t
  \tempo 8 = 126
  \partial 8 * 5 s4 s4.
  s1*9/8 * 8 |
  
  \barNumberCheck 9
  s1*9/8 * 7 |
  s4. \tuplet 4/3 { s8 \tempo 8 = 40 s \tempo 8 = 126 s4 } s4. |
  s4. \tuplet 4/3 { s8 \tempo 8 = 40 s \tempo 8 = 126 s4 } s4. |
  s4. \tuplet 4/3 { s8 \tempo 8 = 40 s \tempo 8 = 126 s4 } s4. |
}

% MIDI only
pedal = {
  \partial 8 * 5 s4 s4.
  s2.\sd s4.\su |
  s2.\sd s4.\su |
  s2.\sd s4.\su |
  s4.\sd s8 s4\su\sd s4 s8\su |
  s2.\sd s4.\su |
  s2.\sd s4.\su |
  s4.\sd s4 s8\su s4.\sd |
  s4.\su\sd s8 s4\su\sd s8\su\sd s4 |
  
  \barNumberCheck 9
  s2.\su s4. |
  s4.\sd s8 s4\su\sd s8 s4\su\sd |
  s2.\su s4. |
  s4.\sd \tuplet 4/3 { s8 s4.\su\sd  } s4 s8\su\sd |
  s4. \tuplet 4/3 { s8 s4.\su\sd } s4 s8\su\sd |
  s4. s8. s\su\sd s4 s8\su\sd |
  s4. s8\su s4 s4. |
  s4. s8. s\sd s4 s8\su\sd |
  
  \barNumberCheck 17
  s4. s8. s\su\sd s4 s8\su\sd |
  s4. s8. s\su\sd s4 s8\su\sd |
  s4. s8\su s4 s4. |
}

forceBreaks = {
  \partial 8 * 5 s4 s4.
  s1*9/8 * 2 s1*9/8 \break
  s1*9/8 * 3 s1*9/8 \break
  s1*9/8 * 3 s1*9/8 \break
  s1*9/8 * 3 s1*9/8 \break
  s1*9/8 * 2 s1*9/8 \break
}

preludeTwelveNotes =
\score {
  \header {
    title = "12."
    composer = "Alexander Scriabin"
    opus = "Opus 11, No. 12"
  }
  \keepWithTag layout  
  \new PianoStaff <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Devnull \tempi
    \new Devnull \forceBreaks
  >>
  \layout {}
}

\include "articulate.ly"

preludeTwelveMidi =
\book {
  \bookOutputName "prelude-op11-no12"
  \score {
    \keepWithTag midi
    \articulate <<
      \new Staff = "upper" << \rightHand \dynamics \tempi \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \tempi \pedal >>
    >>
    \midi {}
  }
}
