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

.bot-message strong{
    color:#111;
    font-weight:700;
}

.bot-message .chat-detail-label{
    color:#111;
    font-size:16px;
}

.listing-results{
    display:flex;
    flex:1;
    min-width:0;
    flex-direction:column;
    gap:12px;
}

.listing-results .listing-card{
    width:100%;
    max-width:100%;
    box-sizing:border-box;
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
          <button class="suggestion" data-category="Restaurants">Restaurants 🍔</button>
          <button class="suggestion" data-category="Hotels">Hotels 🏨</button>
          <button class="suggestion" data-category="Salons">Salons 💇</button>
          <button class="suggestion" data-category="Gyms">Gyms 🏋️</button>
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
        message.innerHTML = formatBotMessage(text);
    } else {
        message.textContent = text;
    }

    row.appendChild(message);
    chatBody.appendChild(row);
    scrollChat();

    return message;
}

function formatBotMessage(text = "") {
    // Pehle text ko safe banata hai
    let formatted = escapeHtml(text);

    // Description aur Location ko separate formatted lines banata hai
    formatted = formatted.replace(
        /\s*-\s*\*\*(Description|Location)\*\*:?\s*/gi,
        '<br><br><span class="chat-detail-label">- <strong>$1:</strong></span> '
    );

    // Agar "-" nahi laga hua ho, tab bhi Description / Location format ho
    formatted = formatted.replace(
        /\s*\*\*(Description|Location)\*\*:?\s*/gi,
        '<br><br><span class="chat-detail-label">- <strong>$1:</strong></span> '
    );

    // **Any text** ko bold banata hai
    formatted = formatted.replace(
        /\*\*(.*?)\*\*/g,
        '<strong>$1</strong>'
    );

    // Normal new line ko HTML line break banata hai
    formatted = formatted.replace(/\n/g, '<br>');

    return formatted;
}

function escapeHtml(value = "") {
    const element = document.createElement("div");
    element.textContent = value;
    return element.innerHTML;
}

function addListingCard(listing, shouldScroll = true, container = null) {
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

    // Agar group container diya hai, to bot icon ke bina card add hoga
    if (container) {
        container.appendChild(card);

        if (shouldScroll) {
            scrollChat();
        }

        return;
    }

    const row = document.createElement("div");
    row.className = "message-row";

    const avatar = document.createElement("div");
    avatar.className = "bot-mini-avatar";
    avatar.innerHTML = `<img src="${botIcon}" alt="">`;

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

    if (waitingForCity && selectedCategory) {
        /*
        Input example:
        Find Restaurants [Delhi]

        Brackets ke andar se sirf city nikalega.
        */
        const cityMatch = inputMessage.match(/\[([^\]]*)\]/);
        const city = cityMatch ? cityMatch[1].trim() : inputMessage;

        // User ne abhi [city] replace nahi kiya
        if (!city || city.toLowerCase() === "city") {
            messageInput.focus();
            return;
        }

        addMessage(inputMessage, "user");
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

        const listings = data?.metadata?.listing_links || [];
        const fullText = data.response_text || "";

        /*
        Example:
        "Here are some travel agencies you might find interesting:
        1. **Kailash Mansarovar Yatra** ..."

        Isse sirf colon se pehle wali heading li jayegi.
        */
        let heading = fullText.split(/:\s*(?=\d+\.|\*\*)/)[0].trim();

        /* Fallback heading */
        if (!heading) {
            heading = listings.length
                ? "Here are some listings you might find interesting:"
                : "Sorry, I could not understand that.";
        }

       /* Heading aur listing cards ek hi bot group mein show honge */
        const resultRow = document.createElement("div");
        resultRow.className = "message-row";

        const avatar = document.createElement("div");
        avatar.className = "bot-mini-avatar";
        avatar.innerHTML = `<img src="${botIcon}" alt="">`;

        const resultContent = document.createElement("div");
        resultContent.className = "listing-results";

        const headingMessage = document.createElement("div");
        headingMessage.className = "bot-message";
        headingMessage.innerHTML = formatBotMessage(heading);

        resultContent.appendChild(headingMessage);

        /* Listing cards: inke side mein separate bot icon nahi hoga */
        if (listings.length) {
            listings.forEach((listing) => {
                addListingCard(listing, false, resultContent);
            });
        }

        resultRow.appendChild(avatar);
        resultRow.appendChild(resultContent);
        chatBody.appendChild(resultRow);

        /* Sab render hone ke baad scroll */
        scrollChat();

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

        // Emoji ke bina category name: Restaurants, Hotels, Salons, Gyms
        selectedCategory = button.dataset.category ||
            button.textContent.trim().split(/\s+/)[0];

        waitingForCity = true;

        // Input mein pre-filled city template
        messageInput.value = `Find ${selectedCategory} [city]`;
        messageInput.placeholder = "Enter city name...";

        // [city] poora select hoga
        const cityStart = messageInput.value.indexOf("[city]");
        const cityEnd = cityStart + "[city]".length;

        messageInput.focus();
        messageInput.setSelectionRange(cityStart, cityEnd);
    });
});
</script>
