export const setDate = (date) => {
  const dateObject = new Date(date);
  const formattedDate = dateObject.toLocaleDateString("id-ID", {
    dateStyle: "long",
  });

  return formattedDate;
};

export const toDateInputValue = (date) => {
  return new Date(date).toISOString().split("T")[0];
};

export const setDateTime = (dateString) => {
  const dateObject = new Date(dateString).toLocaleString("id-ID", {
    dateStyle: "short",
    timeStyle: "short",
  });
  return dateObject;
};
