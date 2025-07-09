import React, { Suspense } from "react";
import SignIn from "@/components/SignIn";

const SignInPage = () => {
  return (
    <Suspense fallback={<div>loading...</div>}>
      <SignIn />
    </Suspense>
  );
};

export default SignInPage;
