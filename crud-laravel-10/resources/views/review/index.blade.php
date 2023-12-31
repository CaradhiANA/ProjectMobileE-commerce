@extends('layout.master')
@section('content')
<div class="col py-3">
    <div>
        <hr>
        <h3 class="text-center my-4">Data Review</h3>
        <hr>
        <hr>
    </div>
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <a href="{{ route('reviews.create') }}" class="btn btn-md btn-success mb-3">+ TAMBAH DATA</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">PRODUCT</th>
                        <th scope="col">USER</th>
                        <th scope="col">COMMENTS</th>
                        <th scope="col">RATING</th>
                        <th scope="col">AKSI</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($reviews as $review)
                        <tr>
                            <td>{{ $review->id }}</td>
                            <td>{{ $review->product->nama }}</td>
                            <td>{{ $review->user->name }}</td>
                            <td>{{ $review->text }}</td>
                            <td>{{ $review->rating }}</td>
                            <td class="text-center">
                                <form onsubmit="return confirm('Apakah Anda Yakin ?');" action="{{ route('reviews.destroy', $review->id) }}" method="POST">
                                    <a href="{{ route('reviews.edit', $review->id) }}" class="btn btn-sm btn-primary">EDIT</a>
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger">HAPUS</button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="text-center">
                                <div class="alert alert-danger">
                                    Data Review belum Tersedia.
                                </div>
                            </td>
                        </tr>
                    @endforelse

                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
