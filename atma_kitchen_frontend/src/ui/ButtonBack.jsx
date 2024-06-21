import { useMoveBack } from "../utils/useMoveBack";

function ButtonBack() {
  const moveBack = useMoveBack();
  return (
    <button className="text-pink-primary print:hidden" onClick={moveBack}>
      &larr; Back
    </button>
  );
}

export default ButtonBack;
