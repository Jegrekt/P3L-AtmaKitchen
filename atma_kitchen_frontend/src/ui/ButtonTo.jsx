import { useMoveTo } from "../utils/useMoveTo";
function ButtonTo({ path }) {
  const moveTo = useMoveTo(path);
  return (
    <button className="text-pink-primary" onClick={moveTo}>
      &larr; Back
    </button>
  );
}

export default ButtonTo;
