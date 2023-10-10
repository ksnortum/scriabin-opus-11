%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....

\version "2.24.0"

\include "includes/header-paper.ily"
\include "includes/title-page.ily"
\include "includes/prelude-op11-no01-parts.ily"
\include "includes/prelude-op11-no02-parts.ily"
\include "includes/prelude-op11-no03-parts.ily"
\include "includes/prelude-op11-no04-parts.ily"
\include "includes/prelude-op11-no05-parts.ily"
\include "includes/prelude-op11-no06-parts.ily"
\include "includes/prelude-op11-no07-parts.ily"
\include "includes/prelude-op11-no08-parts.ily"
\include "includes/prelude-op11-no09-parts.ily"
\include "includes/prelude-op11-no10-parts.ily"
\include "includes/prelude-op11-no11-parts.ily"
\include "includes/prelude-op11-no12-parts.ily"
\include "includes/prelude-op11-no13-parts.ily"
\include "includes/prelude-op11-no14-parts.ily"
\include "includes/prelude-op11-no15-parts.ily"
\include "includes/prelude-op11-no16-parts.ily"
\include "includes/prelude-op11-no17-parts.ily"
\include "includes/prelude-op11-no18-parts.ily"
\include "includes/prelude-op11-no19-parts.ily"
\include "includes/prelude-op11-no20-parts.ily"
\include "includes/prelude-op11-no21-parts.ily"
\include "includes/prelude-op11-no22-parts.ily"
\include "includes/prelude-op11-no23-parts.ily"
\include "includes/prelude-op11-no24-parts.ily"

% Title page

\titlePage

% Table of contents

\bookpart {
  \header {
    title = ##f
    subtitle = ##f
    composer = ##f
    arranger = ##f
    copyright = ##f
    tagline = ##f
  }
  \markuplist \table-of-contents
}

% PDFs

\tocItem \markup "Prelude no. 1 in C major"
\preludeOneNotes
\pageBreak

\tocItem \markup "Prelude no. 2 in A minor"
\preludeTwoNotes
\pageBreak

\tocItem \markup "Prelude no. 3 in G major"
\preludeThreeNotes
\pageBreak

\tocItem \markup "Prelude no. 4 in E minor"
\preludeFourNotes
\pageBreak

\tocItem \markup "Prelude no. 5 in D major"
\preludeFiveNotes
\pageBreak

\tocItem \markup "Prelude no. 6 in B minor"
\preludeSixNotes
\pageBreak

\tocItem \markup "Prelude no. 7 in A major"
\preludeSevenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 8 in F" \raise #0.75 \teeny \sharp " minor" 
}
\preludeEightNotes
\pageBreak

\tocItem \markup "Prelude no. 9 in E major"
\preludeNineNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 10 in C" \raise #0.75 \teeny \sharp " minor" 
}
\preludeTenNotes
\pageBreak

\tocItem \markup "Prelude no. 11 in B major"
\preludeElevenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 12 in G" \raise #0.75 \teeny \sharp " minor" 
}
\preludeTwelveNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 13 in G" \raise #0.75 \teeny \flat " major" 
}
\preludeThirteenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 14 in E" \raise #0.75 \teeny \flat " minor" 
}
\preludeFourteenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 15 in D" \raise #0.75 \teeny \flat " major" 
}
\preludeFifteenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 16 in B" \raise #0.75 \teeny \flat " minor" 
}
\preludeSixteenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 17 in A" \raise #0.75 \teeny \flat " major" 
}
\preludeSeventeenNotes
\pageBreak

\tocItem \markup "Prelude no. 18 in F minor"
\preludeEighteenNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 19 in E" \raise #0.75 \teeny \flat " major" 
}
\preludeNineteenNotes
\pageBreak

\tocItem \markup "Prelude no. 20 in C minor"
\preludeTwentyNotes
\pageBreak

\tocItem \markup \concat { 
  "Prelude no. 21 in B" \raise #0.75 \teeny \flat " major" 
}
\preludeTwentyOneNotes
\pageBreak

\tocItem \markup "Prelude no. 22 in G minor"
\preludeTwentyTwoNotes
\pageBreak

\tocItem \markup "Prelude no. 23 in F major"
\preludeTwentyThreeNotes
\pageBreak

\tocItem \markup "Prelude no. 24 in D minor"
\preludeTwentyFourNotes

% Midi

\preludeOneMidi
\preludeTwoMidi
\preludeThreeMidi
\preludeFourMidi
\preludeFiveMidi
\preludeSixMidi
\preludeSevenMidi
\preludeEightMidi
\preludeNineMidi
\preludeTenMidi
\preludeElevenMidi
\preludeTwelveMidi
\preludeThirteenMidi
\preludeFourteenMidi
\preludeFifteenMidi
\preludeSixteenMidi
\preludeSeventeenMidi
\preludeEighteenMidi
\preludeNineteenMidi
\preludeTwentyMidi
\preludeTwentyOneMidi
\preludeTwentyTwoMidi
\preludeTwentyThreeMidi
\preludeTwentyFourMidi
