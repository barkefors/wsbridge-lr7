
<h1>Websocket Example</h2>

<div>
    <input id="${namespace}message">
</div>
<textarea id="${namespace}output"></textarea>

<script>

(function() {

const ws = new WebSocket('${websocketURL}');
const output = document.querySelector('#${namespace}output');
const input = document.querySelector('#${namespace}message');

ws.onmessage = event => {
    const text = event.data + '\n';
    output.value += text;
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