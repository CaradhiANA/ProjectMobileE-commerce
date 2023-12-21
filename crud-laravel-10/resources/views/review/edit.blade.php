@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <form action="{{ route('reviews.update', $review->id) }}" method="POST" enctype="multipart/form-data">

                @csrf
                @method('PUT') <!-- Use PUT method for update -->

                <div class="form-group">
                    <label class="font-weight-bold">Booking ID</label>
                    <input type="text" class="form-control @error('booking_id') is-invalid @enderror" name="booking_id" value="{{ old('booking_id', $review->booking_id) }}" placeholder="Masukkan Booking ID">

                    @error('booking_id')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Comments</label>
                    <textarea class="form-control @error('comments') is-invalid @enderror" name="comments" placeholder="Masukkan Comments">{{ old('comments', $review->comments) }}</textarea>

                    @error('comments')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Star Rating</label>
                    <select class="form-control @error('star_rating') is-invalid @enderror" name="star_rating">
                        <option value="" disabled>Pilih Star Rating</option>
                        @for ($i = 1; $i <= 5; $i++)
                            <option value="{{ $i }}" {{ old('star_rating', $review->star_rating) == $i ? 'selected' : '' }}>{{ $i }}</option>
                        @endfor
                    </select>

                    @error('star_rating')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Status</label>
                    <input type="text" class="form-control @error('status') is-invalid @enderror" name="status" value="{{ old('status', $review->status) }}" placeholder="Masukkan Status">

                    @error('status')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <button type="submit" class="btn btn-md btn-primary">UPDATE</button>
                <a href="{{ route('review.index') }}" class="btn btn-md btn-secondary">BATAL</a>

            </form>
        </div>
    </div>
</div>
@endsection
