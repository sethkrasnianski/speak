# Speak

A simple cli that allows you to read from a speech YAML file, with designated times and messages, and speak the given message at the specified time.

## Usage

Edit `speak.rb` to read your designated speech.yml file in the following format:

```yaml
"hh:mm:ss": "message"
```

So the following example would say `Hello World!` in 38 seconds.

```yaml
"00:00:38": "Hello World!"
```
