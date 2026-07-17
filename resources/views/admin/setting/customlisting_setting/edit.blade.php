@extends('layouts.admin')
@section('title', get_phrase('System Settings'))
@section('admin_layout')

<div class="ol-card radius-8px">
    <div class="ol-card-body my-2 py-20px px-20px">
        <div class="d-flex align-items-center justify-content-between gap-3 flex-wrap flex-md-nowrap">
            <h4 class="title fs-16px">
                <i class="fi-rr-settings-sliders me-2"></i>
              {{ get_phrase("Edit {$editcustlisting->listing_type} Listing Frontend Settings") }}
            </h4>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <form action="{{ route('admin.customer.updatecustomlisting', $editcustlisting->id) }}" method="POST" enctype="multipart/form-data">
            @csrf 
       <input type="hidden" name="seo_on_page" value="1">

            {{-- Listing Type --}}
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12 mb-3">
                    <div class="fbq-7">
                        <label for="listing_type" class="form-label ol-form-label">{{ get_phrase('Listing Type') }} </label>
                        <input type="text" class="form-control ol-form-control" name="listing_type" value="{{ $editcustlisting->listing_type }}" Readonly>
                    </div>
                </div>
            </div>

            {{-- Banner Section --}}
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7">
                        <label for="banner_bg_image" class="form-label ol-form-label"> {{ get_phrase('Banner') }} </label>
                        @if($editcustlisting->banner_bg_image)
                            <div class="mb-2">
                                <img src="{{ asset($editcustlisting->banner_bg_image) }}" alt="Banner" width="120">
                            </div>
                        @endif
                        <input type="file" name="banner_bg_image" id="banner_bg_image" class="form-control" accept="image/*">
                    </div> 
                </div>

                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7">
                        <label for="banner_title" class="form-label ol-form-label"> {{ get_phrase('Banner Title') }} </label>
                        <input type="text" class="form-control ol-form-control" name="banner_title" value="{{ $editcustlisting->banner_title }}">
                    </div> 
                </div>

                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="banner_tab_name" class="form-label ol-form-label"> {{ get_phrase('Banner Tab Name') }} </label>
                        <input type="text" class="form-control ol-form-control" name="banner_tab_name" value="{{ $editcustlisting->banner_tab_name }}">
                    </div> 
                </div>
                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="banner_tab_link" class="form-label ol-form-label"> {{ get_phrase('Banner Tab Link') }} </label>
                        <input type="text" class="form-control ol-form-control" name="banner_tab_link" value="{{ $editcustlisting->banner_tab_link }}">
                    </div> 
                </div>
                <div class="col-lg-12 col-md-12 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="banner_description" class="form-label ol-form-label"> {{ get_phrase('Banner Description') }} </label>
                        <textarea name="banner_description" class="form-control ol-form-control">{{ $editcustlisting->banner_description }}</textarea>
                    </div>  
                </div>
            </div>

            {{-- CTA Section --}}
            <div class="row">
                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7">
                        <label for="cta_bg_image" class="form-label ol-form-label"> {{ get_phrase('CTA') }} </label>
                        @if($editcustlisting->cta_bg_image)
                            <div class="mb-2">
                                <img src="{{ asset($editcustlisting->cta_bg_image) }}" alt="CTA" width="120">
                            </div>
                        @endif
                        <input type="file" name="cta_bg_image" id="cta_bg_image" class="form-control" accept="image/*">
                    </div> 
                </div>

                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7">
                        <label for="cta_bg_title" class="form-label ol-form-label"> {{ get_phrase('CTA Title') }} </label>
                        <input type="text" class="form-control ol-form-control" name="cta_bg_title" value="{{ $editcustlisting->cta_bg_title }}">
                    </div> 
                </div>

                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="cta_tab_name" class="form-label ol-form-label"> {{ get_phrase('CTA Tab Name') }} </label>
                        <input type="text" class="form-control ol-form-control" name="cta_tab_name" value="{{ $editcustlisting->cta_tab_name }}">
                    </div> 
                </div>
                <div class="col-lg-6 col-md-6 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="cta_tab_link" class="form-label ol-form-label"> {{ get_phrase('CTA Tab Link') }} </label>
                        <input type="text" class="form-control ol-form-control" name="cta_tab_link" value="{{ $editcustlisting->cta_tab_link }}">
                    </div> 
                </div>
                <div class="col-lg-12 col-md-12 col-12 mb-3">
                    <div class="fpb-7 mb-3">
                        <label for="cta_bg_description" class="form-label ol-form-label"> {{ get_phrase('CTA Description') }} </label>
                        <textarea name="cta_bg_description" class="form-control ol-form-control">{{ $editcustlisting->cta_bg_description }}</textarea>
                    </div>  
                </div>
            </div>

            {{-- Submit --}}
            <div class="fpb-7 mb-3">
                <button type="submit" class="btn ol-btn-primary ">{{ get_phrase('Update Settings') }}</button>
            </div>
        </form>
    </div>
</div>

@endsection

 