@extends('layout.master')
@section('content')
<div class="col-md-12">
    <div class="card border-0 shadow-sm rounded">
        <div class="card-body">
            <form action="{{ route('reviews.store') }}" method="POST" enctype="multipart/form-data">


                @csrf

                <div class="form-group">
                    <label class="font-weight-bold">Booking ID</label>
                    <input type="text" class="form-control @error('booking_id') is-invalid @enderror" name="booking_id" value="{{ old('booking_id') }}" placeholder="Masukkan Booking ID">

                    <!-- error message untuk booking_id -->
                    @error('booking_id')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Comments</label>
                    <textarea class="form-control @error('comments') is-invalid @enderror" name="comments" placeholder="Masukkan Comments">{{ old('comments') }}</textarea>

                    <!-- error message untuk comments -->
                    @error('comments')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Star Rating</label>
                    <select class="form-control @error('star_rating') is-invalid @enderror" name="star_rating">
                        <option value="" disabled selected>Pilih Star Rating</option>
                        @for ($i = 1; $i <= 5; $i++)
                            <option value="{{ $i }}" {{ old('star_rating') == $i ? 'selected' : '' }}>{{ $i }}</option>
                        @endfor
                    </select>

                    <!-- error message untuk star_rating -->
                    @error('star_rating')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <div class="form-group">
                    <label class="font-weight-bold">Status</label>
                    <input type="text" class="form-control @error('status') is-invalid @enderror" name="status" value="{{ old('status') }}" placeholder="Masukkan Status">

                    <!-- error message untuk status -->
                    @error('status')
                        <div class="alert alert-danger mt-2">
                            {{ $message }}
                        </div>
                    @enderror
                </div>

                <button type="submit" class="btn btn-md btn-primary">SIMPAN</button>
                <button type="reset" class="btn btn-md btn-warning">RESET</button>

            </form>
        </div>
    </div>
</div>
@endsection
