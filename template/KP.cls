%% laporankp.cls
%% ================================================================
%% Kelas LaTeX untuk Laporan Kerja Praktik (KP)
%% Program Studi Sistem dan Teknologi Informasi
%% Sekolah Teknik Elektro dan Informatika
%% Institut Teknologi Bandung
%%
%% Dibuat oleh: IGB Baskara Nugraha
%% Email: baskara@itb.ac.id
%%
%% Diturunkan (extract) dari template "Laporan_KP.tex" versi 1.0
%% menjadi berkas kelas (.cls) agar berkas dokumen utama menjadi
%% lebih ringkas: cukup \documentclass{KP}
%%
%% Kompilasi: xelatex -> biber -> xelatex -> xelatex
%% ================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{KP}[2026/08/04 v1.0 Kelas Laporan Kerja Praktik STI ITB]

% ----------------------------------------------------------------
% OPSI KELAS
% ----------------------------------------------------------------
% Semua opsi yang tidak dikenali akan diteruskan ke kelas dasar "book"
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{book}%
}
\ProcessOptions\relax

% Kelas dasar: book, ukuran default 12pt, kertas A4
\LoadClass[12pt,a4paper]{book}

% ----------------------------------------------------------------
% PAKET-PAKET UTAMA
% ----------------------------------------------------------------
\RequirePackage[utf8]{inputenc}     % for UTF-8 encoding
\RequirePackage{fontspec}           % for font selection
\RequirePackage[indonesian]{babel}  % untuk bahasa Indonesia
\RequirePackage{csquotes}           % for context-sensitive quotation facilities
\RequirePackage{setspace}           % for line spacing
\RequirePackage{graphicx}           % for images
\RequirePackage{caption}            % for customizing captions
\RequirePackage{subcaption}         % for sub-figures
\RequirePackage{hyperref}           % for hyperlinks
\RequirePackage{tocloft}            % for customizing table of contents
\RequirePackage{titlesec}           % for customizing titles
\RequirePackage{lipsum}             % for dummy text (lorem ipsum text)
\RequirePackage{floatrow}           % for customizing float (figure and table) positions
\RequirePackage{listings}           % for code listing
\RequirePackage{amsmath}            % for math
\RequirePackage{amssymb}            % for math symbols
\RequirePackage[shortlabels]{enumitem} % for customizing lists
\RequirePackage[skip=12pt]{parskip} % for spacing between paragraphs
\RequirePackage{longtable}          % for long tables
\RequirePackage{booktabs}           % for better table rules
\RequirePackage[bahasai]{datetime2} % for date formatting in Indonesian
\RequirePackage{geometry}           % for page margins
\RequirePackage{algorithm}          % for algorithms
\RequirePackage{algorithmicx}       % for algorithmic environment
\RequirePackage{algpseudocode}      % for pseudocode
\RequirePackage{microtype}          % Untuk optimasi typography dan spacing
\RequirePackage{array}              % for better arrays (eg. in tabular environment)
\RequirePackage{threeparttable}     % for tables with notes
\RequirePackage{tabularx}           % for tables with adjustable-width columns
\RequirePackage{xcolor}             % for color definitions
\RequirePackage[title,titletoc]{appendix} % for appendix management
\RequirePackage[
    style=apa,
    backend=biber,
    language=english,
    autolang=other
]{biblatex} % for bibliography management with APA style

% ==========================================
% PENGATURAN DOKUMEN
% ==========================================
% Semua sintaks di bawah ini digunakan untuk mengatur tampilan dokumen sesuai
% dengan pedoman penulisan laporan di Program Studi Sistem dan Teknologi
% Informasi ITB. Silakan disesuaikan jika diperlukan.
% ==========================================

% --- Dokumen: Format dokumen ini adalah two-sided (default) untuk menghemat
%     kertas. Uncomment bagian twoside=false jika ingin single-sided ---
\geometry{
      a4paper,
      %twoside=false,
      inner=4cm,
      outer=3cm,
      top=3cm,
      bottom=3cm
}
% -- Halaman: No Header dan No Footer ---
\pagestyle{plain}
% --- Font: Times New Roman ---
\setmainfont{Times New Roman} % set main font to Times New Roman

% --- Paragraf: jarak antarbaris dan antarparagraf ---
\onehalfspacing % spasi 1.5
\setlength{\parindent}{0pt}
\setlength{\parskip}{12pt plus 2pt minus 1pt}

% --- Cover Page: Ubah nama bulan ke Bahasa Indonesia ---
\renewcommand*{\DTMbahasaimonthname}[1]{%
  \ifcase#1 %
    \or Januari%  % 1st month
    \or Februari%  % 2nd month
    \or Maret%  % 3rd month
    \or April%  % 4th month
    \or Mei%  % 5th month
    \or Juni%  % 6th month
    \or Juli%  % 7th month
    \or Agustus%  % 8th month
    \or September%  % 9th month
    \or Oktober%  % 10th month
    \or November%  % 11th month
    \or Desember%  % 12th month
  \fi
}

% --- Daftar Pustaka: Terjemahan istilah daftar pustaka ke Bahasa Indonesia ---
\DefineBibliographyStrings{english}{
  and          = {dan},
  andothers    = {dkk.},
  editor       = {penyunting},
  editors      = {penyunting},
  translator   = {penerjemah},
  byeditor     = {disunting oleh},
  bytranslator = {diterjemahkan oleh},
  in           = {dalam},
  edition      = {edisi},
  pages        = {hal.},
  page         = {hal.},
  volume       = {vol.},
  number       = {no.},
  urlseen      = {diakses pada},
  url          = {tautan},
}

% --- Daftar Pustaka: ubah format sitasi menjadi (Author Year) ---
\let\oldcite\cite
\renewcommand{\cite}{\parencite}

% --- Daftar Pustaka: hilangkan koma sebelum 'dan' pada daftar pustaka ---
\renewcommand*{\finalandcomma}{}

% --- Daftar Pustaka: tampilan kata dengan hyperlinks supaya tidak berwarna biru ---
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=black
}

% === DAFTAR ISI, DAFTAR GAMBAR, DAFTAR TABEL, DAFTAR LISTING, DAFTAR ALGORITMA ====
% --- Daftar Isi: Ubah nama list of listing ke "DAFTAR KODE PROGRAM" ---
\renewcommand{\lstlistlistingname}{DAFTAR KODE PROGRAM}
\renewcommand{\lstlistingname}{Kode Program}
\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true}

% --- Daftar Isi: Ubah nama list of algorithm ke "DAFTAR ALGORITMA" ---
\renewcommand{\algorithmname}{Algoritma}
\renewcommand{\listalgorithmname}{DAFTAR ALGORITMA}
\lstset{basicstyle=\ttfamily\footnotesize,breaklines=true}
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}

% --- Daftar Isi: Atur jarak titik-titik pada daftar isi ---
\renewcommand \cftchapdotsep{4.5}
%\cftsetrmarg{4em}  % agar judul subbab tidak mepet ke nomor halaman di daftar isi (optional)

% -- Daftar Isi: Atur indentasi judul bab, subbab, dan subsubbab di daftar isi ---
\setlength{\cftchapindent}{0em}
\setlength{\cftchapnumwidth}{1.8em}
\setlength{\cftsecindent}{1.8em}
\setlength{\cftsecnumwidth}{2.4em}
\setlength{\cftsubsecindent}{4.2em}
\setlength{\cftsubsecnumwidth}{2.8em}
\setlength{\cftsubsubsecindent}{7.0em}
\setlength{\cftsubsubsecnumwidth}{3.5em}

% --- Kode: Tampilan kode sumber. Silakan diubah sesuai selera dan kebutuhan ---
% --- Kode: Define colors for syntax highlighting ---
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.95}

% --- Kode: Configure listings style ---
\lstdefinestyle{pythonstyle}{
    backgroundcolor=\color{backcolour},
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    language=Python
}
% --- Kode: Apply the defined style ---
\lstset{style=pythonstyle}

% --- FORMAT TAMPILAN JUDUL BAB, SUBBAB, JUDUL GAMBAR DAN TABEL ---
% --- Bab: Counter. Level subbab hanya sampai level 4 (subsubbab), misalnya IV.3.2.1 ---
\setcounter{tocdepth}{4} % kedalaman daftar isi sampai subsubbab
\setcounter{secnumdepth}{4} % kedalaman penomoran sampai subsubbab
% --- Bab: Tampilan Judul Bab ---
\titleformat{\chapter}[display]
      {\centering\normalfont\large\bfseries} % Commands for the entire chapter title
      {\MakeUppercase \chaptertitlename\ \thechapter}{0pt}{\large} % Chapter number format
      \renewcommand\thechapter{\Roman{chapter}}
% --- Bab: Spasi sebelum dan sesudah judul bab/chapter ---
\titlespacing{\chapter}{0pt}{0pt}{5pt}
\titlespacing{\section}{0pt}{6pt}{6pt}
\titlespacing{\subsection}{0pt}{6pt}{6pt}
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

% --- Bab: Judul Subbab dan Subsubbab ---
\titleformat{\section}
	{\normalfont\bfseries}
	{\thesection}{1em}{}
\titleformat{\subsection}
	{\normalfont\bfseries}
	{\thesubsection}{1em}{}
\titleformat{\subsubsection}
	{\normalfont\bfseries}
	{\thesubsubsection}{1em}{}

% --- Gambar: Tampilan judul/caption gambar ---
\captionsetup[figure]{
  labelsep=space,
  format=hang
}
\floatsetup[figure]{
  capposition=bottom
}
% --- Tabel: Tampilan judul/caption tabel ---
\captionsetup[table]{
  labelsep=space,
  format=hang
}
\floatsetup[table]{
  capposition=top,
  objectset=centering,
  captionskip=6pt
}
% --- Kode: Tampilan judul/caption kode ---
\captionsetup[lstlisting]{
  labelsep=space,
  format=hang,
  justification=raggedright,
  singlelinecheck=false
}
\floatsetup[lstlisting]{
  capposition=top
}
% --- Algoritma: Tampilan judul/caption algoritma ---
\captionsetup[algorithm]{
  labelsep=space,
  format=hang,
  justification=raggedright,
  singlelinecheck=false
}
\floatsetup[algorithm]{
  capposition=top
}

% --- List: Pengaturan jarak antar item di dalam list (enumerate dan itemize) ---
\setlist[enumerate]{nosep, topsep=-10pt} % mengurangi spasi antar item dan atas bawah daftar
\setlist[itemize]{nosep, topsep=-10pt} % mengurangi spasi antar item dan atas bawah daftar

% ----------------------------------------------------------------
% PERINTAH BANTUAN UNTUK BAGIAN FRONTMATTER / MAINMATTER
% ----------------------------------------------------------------
% Gunakan \frontmatterToc di awal \frontmatter dan \mainmatterToc di awal
% \mainmatter pada dokumen utama untuk mengatur gaya daftar isi yang berbeda
% antara kedua bagian tersebut (mengikuti pengaturan pada template asli).
\newcommand{\frontmatterToc}{%
  \addtocontents{toc}{\protect\setlength{\cftbeforechapskip}{0pt}}%
  \addtocontents{toc}{\protect\renewcommand{\protect\cftchapfont}{\protect\normalfont}}%
  \addtocontents{toc}{\protect\renewcommand{\protect\cftchappagefont}{\protect\normalfont}}%
  \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}%
}

\newcommand{\mainmatterToc}{%
  \addtocontents{toc}{\protect\setlength{\cftbeforechapskip}{10pt}}%
  \addtocontents{toc}{\protect\renewcommand{\protect\cftchapfont}{\protect\bfseries}}%
  \addtocontents{toc}{\protect\renewcommand{\protect\cftchappagefont}{\protect\bfseries}}%
  \renewcommand{\cftchapleader}{\bfseries\cftdotfill{\cftchapdotsep}}%
}

\endinput
