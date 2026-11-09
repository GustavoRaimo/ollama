#!/bin/sh
set -eu

echo "Starting Ollama server..."
ollama serve &
ollama_pid=$!

cleanup() {
	kill "$ollama_pid" 2>/dev/null || true
	wait "$ollama_pid" 2>/dev/null || true
}

trap cleanup EXIT

until ollama list >/dev/null 2>&1; do
	if ! kill -0 "$ollama_pid" 2>/dev/null; then
		wait "$ollama_pid"
		exit 1
	fi
	sleep 1
done

if [ -n "${OLLAMA_MODEL:-}" ]; then
	echo "Downloading model: $OLLAMA_MODEL"
	ollama pull "$OLLAMA_MODEL"
fi

wait "$ollama_pid"
