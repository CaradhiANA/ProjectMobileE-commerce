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
            <a href="{{ route('review.create') }}" class="btn btn-md btn-success mb-3">+ TAMBAH DATA</a>

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Booking ID</th>
                        <th scope="col">Comments</th>
                        <th scope="col">Star Rating</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($reviews as $review)
                        <tr>
                            <td>{{ $review->id }}</td>
                            <td>{{ $review->booking_id }}</td>
                            <td>{{ $review->comments }}</td>
                            <td>{{ $review->star_rating }}</td>
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
