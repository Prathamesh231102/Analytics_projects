  // Define an array of objects representing each card
  const schemes = [
    {
      title: "Scheme 1",
      description: "Description of Scheme 1",
      link: "#"
    },
    {
      title: "Scheme 2",
      description: "Description of Scheme 2",
      link: "#"
    },
    {
        title: "Scheme 2",
        description: "Description of Scheme 2",
        link: "#"
      }
    // Add more schemes as needed
  ];

  // Function to create a card element
  function createCard(scheme) {
    const card = document.createElement("div");
    card.classList.add("card", "text-center", "mb-4");

    const cardHeader = document.createElement("div");
    cardHeader.classList.add("card-header");

    const cardBody = document.createElement("div");
    cardBody.classList.add("card-body");

    const title = document.createElement("h5");
    title.classList.add("card-title");
    title.textContent = scheme.title;

    const description = document.createElement("p");
    description.classList.add("card-text");
    description.textContent = scheme.description;

    const link = document.createElement("a");
    link.classList.add("btn", "btn-primary");
    link.href = scheme.link;
    link.textContent = "Learn More";

    cardBody.appendChild(title);
    cardBody.appendChild(description);
    cardBody.appendChild(link);

    card.appendChild(cardHeader);
    card.appendChild(cardBody);

    return card;
  }

  // Function to render cards
  function renderCards() {
    const cardContainer = document.getElementById("card-container");
    schemes.forEach((scheme) => {
      const card = createCard(scheme);
      cardContainer.appendChild(card);
    });
  }

  // Call renderCards function to generate cards when the page loads
  window.onload = renderCards;
