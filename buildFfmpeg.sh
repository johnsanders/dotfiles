yum -y install autoconf automake bzip2 bzip2-devel cmake freetype-devel gcc gcc-c++ git libtool make mercurial pkgconfig zlib-devel
mkdir ffmpeg_sources

cd ffmpeg_sources
curl -O -L https://www.nasm.us/pub/nasm/releasebuilds/2.14.02/nasm-2.14.02.tar.bz2
tar xjvf nasm-2.14.02.tar.bz2
cd nasm-2.14.02
./autogen.sh
./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/bin"
make
make install

cd ~/ffmpeg_sources
curl -O -L https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/bin"
make
make install

cd ~/ffmpeg_sources
yum remove nasm && hash -d
git clone --depth 1 https://code.videolan.org/videolan/x264.git
cd x264
PKG_CONFIG_PATH="$HOME/ffmpeg/build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/bin" --enable-static
make
make install

cd ~/ffmpeg_sources
hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg/build" -DENABLE_SHARED:bool=off ../../source
make
make install

cd ~/ffmpeg_sources
git clone --depth 1 https://github.com/mstorsjo/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg/build" --disable-shared
make
make install

cd ~/ffmpeg_sources
curl -O -L https://downloads.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar xzvf lame-3.100.tar.gz
cd lame-3.100
./configure --prefix="$HOME/ffmpeg/build" --bindir="$HOME/ffmpeg/bin" --disable-shared --enable-nasm
make
make install

cd ~/ffmpeg_sources
curl -O -L https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
tar xzvf opus-1.3.1.tar.gz
cd opus-1.3.1
./configure --prefix="$HOME/ffmpeg/build" --disable-shared
make
make install

cd ~/ffmpeg_sources
git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="$HOME/ffmpeg/build" --disable-examples --disable-unit-tests --enable-vp9-highbitdepth --as=yasm
make
make install


cd ~/ffmpeg_sources
curl -O -L https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
tar xjvf ffmpeg-snapshot.tar.bz2
cd ffmpeg
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg/build/lib/pkgconfig" ./configure \
	--prefix="$HOME/ffmpeg/build" \
	--pkg-config-flags="--static" \
	--extra-cflags="-I$HOME/ffmpeg/build/include" \
	--extra-ldflags="-L$HOME/ffmpeg/build/lib" \
	--extra-libs=-lpthread \
	--extra-libs=-lm \
	--bindir="$HOME/bin" \
	--enable-gpl \
	--enable-libfdk_aac \
	--enable-libfreetype \
	--enable-libmp3lame \
	--enable-libopus \
	--enable-libvpx \
	--enable-libx264 \
	--enable-libx265 \
	--enable-nonfree
make
make install
hash -d ffmpeg
