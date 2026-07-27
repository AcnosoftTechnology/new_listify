<style>
.footer-store-link{
    display: flex;
    place-items: center;
    justify-content: space-between;
    gap: 5px;
    margin-top: 25px;
  }
  .playstore a img{
    border: 1px solid #fff;
  }
</style>

<!-- Start Footer Area -->
<footer class="main-footer-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Footer Top Area -->
                <div class="footer-top-area d-flex justify-content-between flex-wrap">
                    <div class="footer-top-details">
                        <h3 class="title">{{get_phrase('Sign up to our newsletter')}}</h3>
                        <p class="info">{{get_phrase('Stay up to date with the latest news, announcements, and articles.')}}</p>
                    </div>
                    <div class="footer-search">
                        <form action="{{ route('newsletter.subscribe') }}" method="post">
                            @csrf
                            <div class="footer-input-wrap">
                                <input class="form-control" name="email" type="search" placeholder="{{get_phrase('Enter your email Address')}}" required>
                                <button type="submit" class="">{{get_phrase('Subscribe')}}</button>
                            </div>
                        </form>

                    </div>
                </div>
                <!-- Footer Middle Area -->
                <div class="footer-middle-area mt-4">
                    <div class="row">
                        <div class="col-lg-4 mb-5">
                            <div class="footer-middle-logo">
                                <a href="{{route('home')}}">
                                 @if(get_frontend_settings('dark_logo'))
                                    <img src="{{ asset('uploads/logo/' . get_frontend_settings('dark_logo')) }}" alt="">
                                @else
                                    <img src="{{ asset('uploads/logo/footer_logo.svg') }}" alt="">
                                @endif
                                </a>
                                <p class="info">{{ get_settings('footer_copyright_text') }}</p>
                            </div>
                          
                                 <div class="footer-store-link">
                                   <div class="playstore">
                                     <a href="https://play.google.com/store/apps/details?id=com.corpmarvel.listify" target="_blank"><img src="https://www.listify.asia/public/image/google-playstore.webp" alt="#"></a>
                                   </div>
                                   <div class="playstore">
                                     <a href="#" target="_blank"><img src="https://www.listify.asia/public/image/ios-appstore.webp" alt="#"></a>
                                   </div>
                                 </div>
                          
                        </div>
                        <div class="col-lg-8 mb-3">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-12 mb-3">
                                    <div class="footer-middle-nav">
                                        <h3 class="title">{{get_phrase('Quick links')}}</h3>
                                        <ul>
                                            <li><a href="{{route('about_us')}}">{{get_phrase('About Us')}}</a></li>
                                            <li><a href="{{route('blogs')}}">{{get_phrase('Blog')}}</a></li>
                                            <li><a href="{{route('pricing')}}">{{get_phrase('Pricing')}}</a></li>
                                            <li><a href="{{route('contact-us')}}">{{get_phrase('Contact Us')}}</a></li>
                                            <li><a href="{{route('privacy-policy')}}">{{get_phrase('Privacy Policy')}}</a></li>
                                            <li><a href="{{route('terms-and-condition')}}">{{get_phrase('Terms and Condition')}}</a></li>
                                            <li><a href="{{route('refund-policy')}}">{{get_phrase('Refund Policy')}}</a></li>
                                        </ul>
                                    </div>
                                </div>
                               <div class="col-lg-6 col-md-6 col-12 mb-3">
                                    <div class="footer-middle-nav foot-cat-nav">
                                        <h3 class="title">{{get_phrase('Categories')}}</h3>
                                   @php
                                        $staticRoutes = ['restaurant', 'hotel', 'beauty', 'real-estate', 'car'];
                                        $menu_items = App\Models\CustomType::where('status', 1)->orderBy('sorting', 'asc')->get();
                                    @endphp

                                    <ul>
                                        @foreach ($menu_items as $item)
                                            @php
                                                $slug = strtolower($item->slug);
                                                $isStatic = in_array($slug, $staticRoutes);
                                                $routeName = $slug . '.home';
                                                $url = $isStatic ? route($routeName) : route('listing.view', ['type' => $slug, 'view' => 'grid']);
                                                $isActive = $isStatic
                                                    ? request()->routeIs($routeName)
                                                    : (request()->routeIs('listing.view') && request()->type == $slug);
                                            @endphp

                                            <li>
                                                <a class="{{ $isActive ? 'active' : '' }}" href="{{ $url }}">
                                                    {{ get_phrase($item->name) }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>


                                    </div>
                               </div>
                          
                               <div class="col-lg-3 col-md-3 col-12 mb-3">
                                <div class="footer-middle-contact footer-middle-nav">
                                    <h3 class="title">{{get_phrase('Contact Us')}}</h3>
                                    <ul>
                                        <li><a href="tel:{{ get_settings('phone') }}">
                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M15.3585 12.7602C14.7204 12.623 14.2156 12.9193 13.7686 13.178C13.3108 13.4446 12.4404 14.1507 11.9414 13.9701C9.38699 12.9183 6.98453 10.6825 5.94451 8.11777C5.76122 7.60819 6.46403 6.73223 6.72869 6.26907C6.98551 5.82072 7.27565 5.31114 7.14332 4.66824C7.02373 4.09052 5.47695 2.12232 4.93 1.58411C4.56928 1.22859 4.19974 1.03305 3.8204 1.00144C2.39418 0.940217 0.801338 2.84324 0.521981 3.2985C-0.177894 4.26927 -0.17397 5.561 0.533742 7.12725C2.23931 11.3343 8.69007 17.6832 12.9128 19.4529C13.6921 19.8173 14.4047 20 15.0448 20C15.6711 20 16.2289 19.8252 16.7083 19.4786C17.0699 19.2702 19.051 17.5983 18.999 16.1338C18.9676 15.7604 18.7726 15.3872 18.4217 15.0257C17.8874 14.4737 15.9319 12.8808 15.3585 12.7602Z" fill="white"/>
                                            </svg>
                                            <span>{{ get_settings('phone') }}</span>                                     
                                        </a></li>
                                        <li><a href="mailto:{{ get_settings('system_email') }}">
                                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M14.1667 2.91663H5.83342C3.33341 2.91663 1.66675 4.16663 1.66675 7.08329V12.9166C1.66675 15.8333 3.33341 17.0833 5.83342 17.0833H14.1667C16.6667 17.0833 18.3334 15.8333 18.3334 12.9166V7.08329C18.3334 4.16663 16.6667 2.91663 14.1667 2.91663ZM14.5584 7.99163L11.9501 10.075C11.4001 10.5166 10.7001 10.7333 10.0001 10.7333C9.30008 10.7333 8.59175 10.5166 8.05008 10.075L5.44175 7.99163C5.17508 7.77496 5.13341 7.37496 5.34175 7.10829C5.55841 6.84163 5.95008 6.79163 6.21675 7.00829L8.82508 9.09163C9.45842 9.59996 10.5334 9.59996 11.1667 9.09163L13.7751 7.00829C14.0417 6.79163 14.4417 6.83329 14.6501 7.10829C14.8667 7.37496 14.8251 7.77496 14.5584 7.99163Z" fill="white"/>
                                            </svg>
                                            <span>{{ get_settings('system_email') }}</span>                                         
                                        </a></li>
                                    </ul>
                                </div>

 
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                      <div class="col-md-4 footer-copy col-12 my-1"><p class="info"><span>{{ get_settings('footer_text') }}</span></p></div>
                      
                      <div class="col-md-5 col-12 d-flex justify-content-center my-1">
                        <div class="footer-payment-stripe">
                         <img src="https://www.listify.asia/public/image/listify-payment-logo-strip.png" style="width:70%;" alt="listify_payment">
                        </div>
                      </div>
                      
                      <div class="col-md-3 footer-social col-12 my-1">
                         <div class="footer-bottom-social">
                            <ul class="d-flex align-items-center">
                                <li><a href="{{get_settings('facebook')}}" target="_Blank">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_8_202)">
                                        <path d="M20.001 10C20.001 4.47715 15.5238 0 10.001 0C4.47813 0 0.000976562 4.47715 0.000976562 10C0.000976562 14.9912 3.65781 19.1283 8.43848 19.8785V12.8906H5.89941V10H8.43848V7.79688C8.43848 5.29063 9.93145 3.90625 12.2156 3.90625C13.3094 3.90625 14.4541 4.10156 14.4541 4.10156V6.5625H13.1932C11.951 6.5625 11.5635 7.3334 11.5635 8.125V10H14.3369L13.8936 12.8906H11.5635V19.8785C16.3441 19.1283 20.001 14.9912 20.001 10Z" fill="white"/>
                                        </g>
                                        <defs>
                                        <clipPath id="clip0_8_202">
                                        <rect width="20" height="20" fill="white" transform="translate(0.000976562)"/>
                                        </clipPath>
                                        </defs>
                                    </svg>                        
                                </a></li>
                                <li><a href="{{get_settings('twitter')}}" target="_Blank">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_8_204)">
                                        <path d="M11.8626 8.46864L19.148 0H17.4216L11.0957 7.3532L6.04323 0H0.21582L7.85612 11.1193L0.21582 20H1.94231L8.6226 12.2348L13.9584 20H19.7858L11.8622 8.46864H11.8626ZM9.49793 11.2173L8.72381 10.1101L2.56439 1.29967H5.21619L10.1869 8.40994L10.961 9.51718L17.4224 18.7594H14.7706L9.49793 11.2177V11.2173Z" fill="white"/>
                                        </g>
                                        <defs>
                                        <clipPath id="clip0_8_204">
                                        <rect width="20" height="20" fill="white" transform="translate(0.000976562)"/>
                                        </clipPath>
                                        </defs>
                                    </svg>                             
                                </a></li>
                                <li><a href="{{get_settings('linkedin')}}" target="_Blank">
                                    <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <g clip-path="url(#clip0_8_210)">
                                        <path d="M18.5205 0H1.47754C0.661133 0 0.000976562 0.644531 0.000976562 1.44141V18.5547C0.000976562 19.3516 0.661133 20 1.47754 20H18.5205C19.3369 20 20.001 19.3516 20.001 18.5586V1.44141C20.001 0.644531 19.3369 0 18.5205 0ZM5.93457 17.043H2.96582V7.49609H5.93457V17.043ZM4.4502 6.19531C3.49707 6.19531 2.72754 5.42578 2.72754 4.47656C2.72754 3.52734 3.49707 2.75781 4.4502 2.75781C5.39941 2.75781 6.16894 3.52734 6.16894 4.47656C6.16894 5.42188 5.39941 6.19531 4.4502 6.19531ZM17.0439 17.043H14.0791V12.4023C14.0791 11.2969 14.0596 9.87109 12.5361 9.87109C10.9932 9.87109 10.7588 11.0781 10.7588 12.3242V17.043H7.79785V7.49609H10.6416V8.80078H10.6807C11.0752 8.05078 12.0439 7.25781 13.4854 7.25781C16.4893 7.25781 17.0439 9.23438 17.0439 11.8047V17.043Z" fill="white"/>
                                        </g>
                                        <defs>
                                        <clipPath id="clip0_8_210">
                                        <rect width="20" height="20" fill="white" transform="translate(0.000976562)"/>
                                        </clipPath>
                                        </defs>
                                    </svg>                       
                                </a></li>
                              
                            </ul>
                        </div>
                      </div>
                       
                       
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
:root{
    --chat-bg:#fff;
    --chat-panel:#121e2b;
    --chat-card:#fff;
    --chat-text:#f3f5f7;
    --chat-muted:#9aa5b1;
    --chat-orange:#6c1cff;
}

#ai-chat-toggle{
    position:fixed;
    /* right:18px;
    bottom:22px; */
    right: 10px;
    bottom: 70px;
    width:62px;
    height:62px;
    padding:0;
    border:0;
    border-radius:50%;
    background: linear-gradient(135deg, #6c1cff, #6c1cff);
    box-shadow:0 10px 25px rgba(0,0,0,.32);
    z-index:99999;
    cursor:pointer;
}
#ai-chat-toggle img{
    width:100%;
    height:100%;
    object-fit:cover;
    border-radius:50%;
}

#ai-chat-box{
    position:fixed;
    right:20px;
    bottom:20px;
    width:400px;
    height:min(720px,calc(100vh - 40px));
    display:none;
    flex-direction:column;
    overflow:hidden;
    z-index:999999;
    color:var(--chat-text);
    background:var(--chat-bg);
    border:1px solid rgba(255,255,255,.08);
    border-radius:24px;
    box-shadow:0 22px 60px rgba(0,0,0,.45);
    font-family:Arial,sans-serif;
}
#ai-chat-box.active{ display:flex; }

.chat-header{
    min-height:86px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding:16px 20px;
    background:#fff;
    border-bottom: 1px solid rgb(108 28 255);
}
.chat-header-left{ display:flex; align-items:center; gap:13px; }
.chat-avatar{
    position:relative;
    width:54px;
    height:54px;
    flex:none;
    padding:2px;
    border-radius:50%;
    background: linear-gradient(135deg, #6c1cff, #6c1cff);
}
.chat-avatar img{
    width:100%;
    height:100%;
    object-fit:cover;
    border-radius:50%;
}
.chat-avatar:after{
    content:"";
    position:absolute;
    right:0;
    bottom:1px;
    width:12px;
    height:12px;
    border:2px solid #14202c;
    border-radius:50%;
    background:#13bd78;
}
.chat-title{font-size: 20px; font-weight: 700; color: var(--chat-orange)}
.chat-subtitle{ margin-top:4px; color:var(--chat-muted); font-size:13px; }

#closeChat{
    border:0;
    color:#c5ccd4;
    background:transparent;
    font-size:29px;
    cursor:pointer;
}

.chat-body{
    flex:1;
    overflow-y:auto;
    padding: 15px 10px;
    background:var(--chat-bg);
}
.message-row{
    display:flex;
    align-items:flex-start;
    gap:12px;
    margin-bottom:16px;
}
.message-row.user-row{ justify-content:flex-end; }

.bot-mini-avatar{
    width:45px;
    height:45px;
    flex:none;
    border-radius:50%;
    overflow:hidden;
    background:var(--chat-orange);
}
.bot-mini-avatar img{
    width:100%;
    height:100%;
    object-fit:cover;
}
.bot-message,
.user-message{
    max-width:82%;
    line-height:1.52;
    word-break:break-word;
}
.bot-message{
    padding:20px;
    color:#000;
    background:var(--chat-card);
    border-radius:20px 20px 20px 5px;
    box-shadow:0 8px 22px rgba(0,0,0,.13);
}
.user-message{
    padding:13px 16px;
    color:#fff;
    background: linear-gradient(135deg, #6c1cff, #6c1cff);
    border-radius:18px 18px 4px 18px;
}

.welcome-title{
    margin-bottom:14px;
    color:var(--chat-orange);
    font-size:22px;
    font-weight:700;
}
.welcome-list{
    margin:18px 0;
    padding:0;
    list-style:none;
}
.welcome-list li{ margin:11px 0; }
.welcome-list li:before{
    content:"✓";
    display:inline-grid;
    place-items:center;
    width:21px;
    height:21px;
    margin-right:12px;
    border-radius:50%;
    color:#fff;
    background:var(--chat-orange);
    font-size:14px;
    font-weight:700;
}

.suggestions{
    display:flex;
    gap:9px;
    overflow-x:auto;
    padding:10px 15px 12px;
    background:var(--chat-bg);
    scrollbar-width:none;
}
.suggestions div{
    display: flex;
    gap: 10px;
    overflow: auto;
}
.suggestions::-webkit-scrollbar{ display:none; }
.suggestion{
     flex: none;
    padding: 9px 14px;
    color: #ffffff;
    border: 1px solid #6c1cff;
    border-radius: 24px;
    white-space: nowrap;
    background: #6c1cff;
}

.chat-footer{
    display:flex;
    align-items:center;
    gap:10px;
    padding:12px 16px 8px;
    background:var(--chat-bg);
}
.chat-footer input{
    min-width:0;
    flex:1;
    height:54px;
    padding:0 18px;
    border:0;
    outline:0;
    color:var(--chat-text);
    border-radius:30px;
    background:#182534;
}
.chat-footer input::placeholder{ color:#7e8a96; }
.chat-footer button{
    width:50px;
    height:50px;
    flex:none;
    border:0;
    border-radius:50%;
    color:#fff;
    background: linear-gradient(135deg, #6c1cff, #6c1cff);
    font-size:22px;
    cursor:pointer;
}
.chat-note{
    padding:0 18px 14px;
    color:#65717e;
    background:var(--chat-bg);
    font-size:11px;
    text-align:center;
}

/* Scrollbar hide rahega, lekin scroll/swap working karega */
.chat-body,
.suggestions div{
    -ms-overflow-style: none;  /* Internet Explorer / old Edge */
    scrollbar-width: none;     /* Firefox */
}

.chat-body::-webkit-scrollbar,
.suggestions div::-webkit-scrollbar{
    width: 0;
    height: 0;
    display: none;             /* Chrome, Safari, new Edge */
}

@media(max-width:600px){
    #ai-chat-box{
        top:0;
        right:0;
        bottom:0;
        width:100%;
        height:100dvh;
        border:0;
        border-radius:0;
    }
    #ai-chat-toggle{ 
        /* bottom:18px; right:18px;  */
        bottom: 70px;
        right: 8px;
    }
    .chat-body{ padding:24px 16px; }
}

.listing-card{
    display:flex;
    align-items:center;
    gap:12px;
    width:calc(100% - 57px);
    min-height:88px;
    padding:12px;
    color:#000;
    text-decoration:none;
    background:#fff;
    border:1.5px solid #6c1cff;
    border-radius:18px;
    box-shadow:0 7px 18px rgba(108,28,255,.12);
    transition:all .2s ease;
}

.listing-card:hover{
    background:#faf7ff;
    transform:translateY(-2px);
    box-shadow:0 10px 22px rgba(108,28,255,.22);
}

.listing-card-image{
    width:56px;
    height:56px;
    flex:none;
    object-fit:cover;
    border-radius:50%;
    background:#f1ebff;
}

.listing-card-content{
    flex:1;
    min-width:0;
}

.listing-card-title{
    overflow:hidden;
    color:#121e2b;
    font-size:16px;
    font-weight:700;
    text-overflow:ellipsis;
    white-space:nowrap;
}

.listing-card-meta{
    margin-top:6px;
    color:#7e8a96;
    font-size:13px;
}

.listing-card-arrow{
    color:#6c1cff;
    font-size:34px;
    line-height:1;
}

.chat-body{
    flex:1;
    overflow-y:auto;
}

</style>

<button id="ai-chat-toggle" aria-label="Open AI Concierge">
    <img src="{{ asset('assets/chatbot/bot-icon.png') }}" alt="AI Concierge">
</button>

<div id="ai-chat-box" role="dialog" aria-label="AI Concierge">
    <div class="chat-header">
        <div class="chat-header-left">
            <div class="chat-avatar">
                <img src="{{ asset('assets/chatbot/bot-icon.png') }}" alt="AI Concierge">
            </div>
            <div>
                <div class="chat-title">AI Concierge ✨</div>
                <div class="chat-subtitle">Your smart companion for Listify</div>
            </div>
        </div>
        <button id="closeChat" aria-label="Close chat">×</button>
    </div>

    <div class="chat-body" id="chatBody">
        <div class="message-row">
            <div class="bot-mini-avatar">
                <img src="{{ asset('assets/chatbot/bot-icon.png') }}" alt="">
            </div>
            <div class="bot-message">
                <div class="welcome-title">Hello, Guest! 👋</div>
                I'm your AI assistant for all things Listify. I can help you:
                <ul class="welcome-list">
                    <li>Discover the best local listings</li>
                    <li>Find top-rated businesses &amp; services</li>
                    <li>Ask about appointments and bookings</li>
                    <li>Get personalized recommendations</li>
                </ul>
                What would you like to explore today?
            </div>
        </div>
    </div>

    <div class="suggestions">
        <div>
          <button class="suggestion">Restaurants 🍔</button>
          <button class="suggestion">Hotels 🏨</button>
          <button class="suggestion">Salons 💇</button>
          <button class="suggestion">Gyms 🏋️</button>
        </div>
    </div>

    <div class="chat-footer">
        <input type="text" id="chatMessage" placeholder="Ask me anything about Listify...">
        <button id="sendMessage" aria-label="Send message">➤</button>
    </div>
    <div class="chat-note">AI Concierge can make mistakes. Please verify important information.</div>
</div>

<script>
const chatBox = document.getElementById("ai-chat-box");
const chatBody = document.getElementById("chatBody");
const messageInput = document.getElementById("chatMessage");
const botIcon = "{{ asset('assets/chatbot/bot-icon.png') }}";

let selectedCategory = null;
let waitingForCity = false;

let session_id = localStorage.getItem("chat_session");
if (!session_id) {
    session_id = "sess_" + Date.now();
    localStorage.setItem("chat_session", session_id);
}

document.getElementById("ai-chat-toggle").onclick = () => {
    chatBox.classList.add("active");
    messageInput.focus();
};

document.getElementById("closeChat").onclick = () => {
    chatBox.classList.remove("active");
};

function scrollChat() {
    chatBody.scrollTop = chatBody.scrollHeight;
}

function addMessage(text, type) {
    const row = document.createElement("div");
    row.className = type === "user" ? "message-row user-row" : "message-row";

    const message = document.createElement("div");
    message.className = type === "user" ? "user-message" : "bot-message";
    message.textContent = text;

    if (type === "bot") {
        const avatar = document.createElement("div");
        avatar.className = "bot-mini-avatar";

        const image = document.createElement("img");
        image.src = botIcon;
        image.alt = "";
        avatar.appendChild(image);
        row.appendChild(avatar);
    }

    row.appendChild(message);
    chatBody.appendChild(row);
    scrollChat();

    return message;
}


function addListingCard(listing, shouldScroll = true) {
    const row = document.createElement("div");
    row.className = "message-row";

    const avatar = document.createElement("div");
    avatar.className = "bot-mini-avatar";
    avatar.innerHTML = `<img src="${botIcon}" alt="">`;

    const card = document.createElement("a");
    card.className = "listing-card";
    card.href = listing.web_url || "#";
    card.target = "_blank";
    card.rel = "noopener noreferrer";

    const title = escapeHtml(listing.title || "View listing");
    const image = listing.image_url || botIcon;

    card.innerHTML = `
        <img class="listing-card-image"
             src="${image}"
             alt="${title}"
             onerror="this.src='${botIcon}'">

        <div class="listing-card-content">
            <div class="listing-card-title">${title}</div>
            <div class="listing-card-meta">Tap to view details</div>
        </div>

        <span class="listing-card-arrow">›</span>
    `;

    row.appendChild(avatar);
    row.appendChild(card);
    chatBody.appendChild(row);

    if (shouldScroll) {
        scrollChat();
    }
}

function escapeHtml(value = "") {
    const element = document.createElement("div");
    element.textContent = value;
    return element.innerHTML;
}

async function sendMessage() {
    let inputMessage = messageInput.value.trim();
    if (!inputMessage) return;

    /* User ne category select ki hui hai, to current message city hai */
    if (waitingForCity && selectedCategory) {
        const city = inputMessage;

        addMessage(city, "user");
        messageInput.value = "";
        messageInput.placeholder = "Ask me anything about Listify...";

        const apiMessage =
            `Show me the best ${selectedCategory} in ${city}. ` +
            `Give local listings and useful recommendations.`;

        selectedCategory = null;
        waitingForCity = false;

        await callChatApi(apiMessage);
        return;
    }

    /* Normal user question */
    addMessage(inputMessage, "user");
    messageInput.value = "";

    await callChatApi(inputMessage);
}

async function callChatApi(message) {
    const typing = addMessage("Typing...", "bot");

    try {
        // Same-origin proxy → api.listify.asia (avoids browser SSL/CORS failures)
        const res = await fetch("{{ url('/api/chat/concierge') }}", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "X-Requested-With": "XMLHttpRequest"
            },
            body: JSON.stringify({
                message: message,
                session_id: session_id,
                user_name: @json(optional(auth()->user())->name ?: 'Guest')
            })
        });

        const data = await res.json().catch(() => ({}));

        if (!res.ok) {
            throw new Error(data.message || ("API Error: " + res.status));
        }

        typing.closest(".message-row").remove();

        addMessage(
            data.response_text || "Here are some matching listings:",
            "bot"
        );

        const listings = data?.metadata?.listing_links || [];

        if (listings.length) {
            listings.forEach((listing) => {
                addListingCard(listing, false); // false = har card ke baad scroll nahi hoga
            });

            scrollChat(); // sab cards add hone ke baad ek hi baar scroll
        }
    } catch (error) {
        typing.textContent = "Connection error. Please try again.";
        console.error(error);
    }
}

document.getElementById("sendMessage").onclick = () => sendMessage();

messageInput.addEventListener("keydown", (event) => {
    if (event.key === "Enter") {
        sendMessage();
    }
});

/* Restaurants / Hotels / Salons / Gyms chip click */
document.querySelectorAll(".suggestion").forEach((button) => {
    button.addEventListener("click", () => {
        selectedCategory = button.textContent.trim();
        waitingForCity = true;

        addMessage(selectedCategory, "user");

        addMessage(
            `Great choice! Which city would you like to search for ${selectedCategory}?`,
            "bot"
        );

        messageInput.value = "";
        messageInput.placeholder = "Enter your city name...";
        messageInput.focus();
    });
});

</script>

<!-- End Footer Area -->