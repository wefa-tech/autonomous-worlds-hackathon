import ReactDOM from "react-dom/client";
import { mount as mountDevTools } from "@latticexyz/dev-tools";
import App from "./App";
import { setup } from "./modules/openar/setup";
import { MUDProvider } from "./hooks/useMud";

import "./index.css";
import { ComingSoon } from "./components/Layout/ComingSoon";

const rootElement = document.getElementById("react-root");
if (!rootElement) throw new Error("React root not found");
const root = ReactDOM.createRoot(rootElement);

if (import.meta.env.PROD) {
  root.render(<ComingSoon />);
} else {
  setup().then((result) => {
    root.render(
      <MUDProvider value={result}>
        <App />
      </MUDProvider>
    );
    // mountDevTools();
  });
}
