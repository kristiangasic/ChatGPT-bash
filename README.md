# ChatGPT Terminal Interaction Script

This script allows you to interact with OpenAI's ChatGPT directly from your terminal. It is specifically designed for free-tier usage and logs the conversation history to a file named `history.txt`. 

---

## Features
- **Interactive Terminal Chat**: Send messages to ChatGPT and receive responses in real-time.
- **Free Tier Model**: Uses `gpt-3.5-turbo`, the model available in OpenAI's free tier.
- **Conversation Logging**: Automatically saves all interactions (user inputs and AI responses) to `history.txt`.

---

## Prerequisites
- **Bash**: This script is designed for Linux or macOS systems with Bash.
- **Dependencies**:
  - `curl`: Used for making HTTP requests to the OpenAI API.
  - `jq`: Used for creating and parsing JSON data.

### Install Dependencies
```bash
sudo apt update && sudo apt install -y curl jq
```

---

## Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/chatgpt-terminal.git
   cd chatgpt-terminal
   ```

2. **Add Your OpenAI API Key**:
   Open the script and replace the placeholder `API_KEY` with your actual OpenAI API key:
   ```bash
   API_KEY="sk-..."  # Replace with your key
   ```

3. **Make the Script Executable**:
   ```bash
   chmod +x chat.sh
   ```

---

## Usage

1. **Run the Script**:
   ```bash
   ./chat.sh
   ```

2. **Start Chatting**:
   - Type your message and press Enter.
   - ChatGPT will respond.
   - Type `exit` to quit the script.

3. **View Conversation History**:
   All interactions are logged in `history.txt`:
   ```bash
   cat history.txt
   ```

---

## Example

### Terminal Session:
```plaintext
ChatGPT Terminal (Free Tier). Type 'exit' to quit.
You: Hello, who are you?
Bob: I'm ChatGPT, your virtual assistant powered by OpenAI. How can I help you today?

You: What is the capital of France?
Bob: The capital of France is Paris.

You: exit
Goodbye!
```

### Logged in `history.txt`:
```plaintext
You: Hello, who are you?
Bob: I'm ChatGPT, your virtual assistant powered by OpenAI. How can I help you today?

You: What is the capital of France?
Bob: The capital of France is Paris.
```

---

## Help

Run the script with the `-h` option to display a help message:
```bash
./chat.sh -h
```

Output:
```plaintext
Usage: ./chat.sh [-h]

Options:
  -h         Display this help message
```

---

## Notes
- **API Key Security**: Keep your API key private to avoid unauthorized access.
- **Rate Limits**: The free tier has usage limits. Check your OpenAI account for details.
- **Error Handling**: If the API key is invalid or the service is unavailable, the script will notify you.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

Feel free to contribute by submitting issues or pull requests! 😊
