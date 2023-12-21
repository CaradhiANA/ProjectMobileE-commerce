@extends('layout.master')
    @section('content') 
        <div class="col-md-12">
            <div class="card border-0 shadow-sm rounded">
                <div class="card-body">
                    <form action="{{ route('posts.update', $post->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="form-group">
                                <label class="font-weight-bold">GAMBAR</label>
                                <input type="file" class="form-control" name="image">
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">NAMA</label>
                                <input type="text" class="form-control @error('nama') is-invalid @enderror" name="nama" value="{{ old('nama', $post->nama) }}" placeholder="Masukkan Nama">
                            
                                <!-- error message untuk title -->
                                @error('nama')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">KATEGORI</label>
                                <input type="text" class="form-control @error('jenis') is-invalid @enderror" name="jenis" value="{{ old('jenis', $post->jenis) }}" placeholder="Masukkan Jenis">
                            
                                <!-- error message untuk content -->
                                @error('jenis')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">HARGA</label>
                                <input type="text" class="form-control @error('harga') is-invalid @enderror" name="harga" value="{{ old('harga', $post->harga) }}" placeholder="Masukkan Harga">
                            
                                <!-- error message untuk content -->
                                @error('harga')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">STOCK</label>
                                <input type="text" class="form-control @error('stock') is-invalid @enderror" name="stock" value="{{ old('stock', $post->stock) }}" placeholder="Masukkan Stock">
                            
                                <!-- error message untuk content -->
                                @error('stock')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">TANGGAL KADALUARSA</label>
                                <input type="date" class="form-control @error('kadaluarsa') is-invalid @enderror" name="kadaluarsa" value="<?php echo strftime('%Y-%m-%d'); ?>">
                                <!-- error message untuk content -->
                                @error('kadaluarsa')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                            <br>
                            <br>

                            <button type="submit" class="btn btn-md btn-primary">UPDATE</button>
                            <a href="{{ route('posts.index') }}" class="btn btn-md btn-secondary">BATAL</a>

                        </form> 
                    </div>
                </div>
            </div>
        </div>

@endsection