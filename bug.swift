func myFunc(param: String) -> String {
    guard let url = URL(string: param) else {
        return "Invalid URL"
    }
    do {
        let contents = try String(contentsOf: url)
        return contents
    } catch {
        return "Error reading URL: \(error)"
    }
}