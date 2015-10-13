
<h1>Websocket Example</h2>

<div>
    <input class="form-control" id="${namespace}message" placeholder="Message...">
</div>
<div>
    <label>Output</label>
    <pre id="${namespace}output"></pre>
</div>

<script>

(function() {

const ws = new WebSocket('${websocketURL}');
const output = document.querySelector('#${namespace}output');
const input = document.querySelector('#${namespace}message');

ws.onmessage = event => {
    const text = event.data + '\n';
    output.textContent += text;
};

ws.onclose = event => {
    output.value += 'CLOSED: ' + event.code;
}

input.addEventListener('keyup', e => {
    if (e.keyCode === 13) {
        ws.send(input.value);
        input.value = '';
    }
});

})();

</script>
