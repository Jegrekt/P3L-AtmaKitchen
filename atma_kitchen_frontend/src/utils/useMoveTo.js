import { useNavigate } from "react-router-dom";

export function useMoveTo(path) {
  const navigate = useNavigate();
  return () => navigate(path);
}
