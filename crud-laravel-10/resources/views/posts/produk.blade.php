@extends('layout.master')
@section('content')
<div class="col py-3">
    <div>
        <hr>
        <h3 class="text-center my-4">Data Produk</h3>
        <hr>
        <hr>

    </div>
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <a href="{{ route('posts.create') }}" class="btn btn-md btn-success mb-3">+ TAMBAH DATA</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">GAMBAR</th>
                        <th scope="col">NAMA</th>
                        <th scope="col">KATEGORI</th>
                        <th scope="col">HARGA</th>
                        <th scope="col">STOCK</th>
                        <th scope="col">TANGGAL KADALUARSA</th>
                        <th scope="col">AKSI</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($posts as $post)
                    <tr>
                        <td class="text-center">
                            <img src="{{ asset('storage/posts/'.$post->image) }}" class="rounded" style="width: 150px">
                        </td>
                        <td>{{ $post->nama }}</td>
                        <td>{{ $post->jenis }}</td>
                        <td>{{ $post->harga }}</td>
                        <td>{{ $post->stock }}</td>
                        <td>{{ $post->kadaluarsa }}</td>
                        <td class="text-center">
                            <form onsubmit="return confirm('Apakah Anda Yakin ?');" action="{{ route('posts.destroy', $post->id) }}" method="POST">
                                <a href="{{ route('posts.edit', $post->id) }}" class="btn btn-sm btn-primary">EDIT</a>
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger">HAPUS</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <div class="alert alert-danger">
                        Data Post belum Tersedia.
                    </div>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    @endsection