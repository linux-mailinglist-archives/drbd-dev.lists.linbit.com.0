Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D1C22E66D
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 09:22:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AC6D4204CA;
	Mon, 27 Jul 2020 09:22:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 990DE420005
	for <drbd-dev@lists.linbit.com>; Sun, 22 Mar 2020 17:34:22 +0100 (CET)
Received: by mail-ed1-f48.google.com with SMTP id a43so13545125edf.6
	for <drbd-dev@lists.linbit.com>; Sun, 22 Mar 2020 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=B28O3UeBTUFmTi85lfzSV6mLRLJVOzJzaafQWN7YacM=;
	b=EcHmccn67hMjtK3wmgdL2hagh6jxEnIP+3GDXh42KhIEHAL59uCCqXJT1693Q4ZP1W
	H1Nwg7ONXyZJt71ZyP8FINq2S59wMAbqjKBPhMihRQydkwPUoalZwvnaq5HFbrhncOY1
	3ILKIiwyaI8uT6OLCUqWquHKVJy2nY+UKoDuNbUZ1dSfJG2v/LsEBHQk1rSGILUkP0ke
	yIhw190PWZV3/qyqo8KMzVZtSSOelZbHF5y5tLJYqXQ8UqyfaG1HgiTTcS49zDgyMRic
	C8uRES29rpCs1Bhq+WqD6GL+ySIeVubk+kcRKEvYeQpNQF35saIYGHlAy+SOJxe7AFbw
	fWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=B28O3UeBTUFmTi85lfzSV6mLRLJVOzJzaafQWN7YacM=;
	b=sJTCLLZ/tOqxpwYwh2a9jSZDOJ61+XVcn5oioLwed1OSNh3jZ+azPCTaM35CNimqli
	+ECwNPvgzyc1fNQ7fVNgQpXVKV2By8+a78ZBiNfW2Rn0uNfazp51ACeeCvBxxBbeB1zg
	NcGQPIitBwLXp9XzBZVvviMGSPS5kg6yPN/jSwRKxH5nEwLQN21xx0CRazX+3ipSZfTP
	SDe5eBSXeAfJQn2Mrgi1LU5yMSl/5+7c5CLwNP79fpCLxr1SNr8Sp/cyNKmQrQV7NDu1
	r26XVgj3GnK60drnv9cXOSiUF1gH5DcGg2TALwTbxMYt3e52g9QZlMHY4rsGvy9FLLxL
	dFlw==
X-Gm-Message-State: ANhLgQ3ECGnV3TEfZQlKyayAbXxMxIfspxHNbJKv73MotuZI9WQyvEO+
	7leafABYE8aMEXdLfIOIH5Wk4lsFiURgVZMgy1fNuX/l
X-Google-Smtp-Source: ADFU+vuctxS4tOvtRXrWuUFx77k5YDRHGspceWja51jhGFgjlEtZ5UNtx02QDFnFbD+JWudGXrd/QKxtUlvmy0ROfYs=
X-Received: by 2002:a50:ed97:: with SMTP id h23mr18105793edr.197.1584894276265;
	Sun, 22 Mar 2020 09:24:36 -0700 (PDT)
MIME-Version: 1.0
From: "T.J. Yang" <tjyang2001@gmail.com>
Date: Sun, 22 Mar 2020 11:24:25 -0500
Message-ID: <CAD2GW8q5meBoNG+ewcWNLZKA7zS6-C2Ubzw9O5_n=p3fgZ83jQ@mail.gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Mon, 27 Jul 2020 09:22:33 +0200
Subject: [Drbd-dev] spatch error message is not accurate
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6674449373529712079=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============6674449373529712079==
Content-Type: multipart/alternative; boundary="00000000000057eb6a05a173f4e1"

--00000000000057eb6a05a173f4e1
Content-Type: text/plain; charset="UTF-8"

Hi

I tried to compile drbd9 master branch  on centos 8 which come with spatch
1.0.7 only.

following is one-liner patch to make error message match the checks(if hash
spatch && spatch_is_recent; then)  in drbd-kernel-compat/gen_compat_patch.sh

diff --git a/drbd/drbd-kernel-compat/gen_compat_patch.sh
b/drbd/drbd-kernel-compat/gen_compat_patch.sh
index 19466081..d6f34286 100644
--- a/drbd/drbd-kernel-compat/gen_compat_patch.sh
+++ b/drbd/drbd-kernel-compat/gen_compat_patch.sh
@@ -105,6 +105,6 @@ elif test ! -e ../.git && [[ $SPAAS = true ]]; then
     echo "  You can create a new .tgz including this pre-computed compat
patch"
     echo "  by calling \"echo drbd-$REL_VERSION/drbd/$compat_patch
>>.filelist ; make tgz\""
 else
-   echo "ERROR: spatch not found in \$PATH. Install package 'coccinelle'!"
+   echo "ERROR: spatch is older than version $MIN_SPATCH_VERSION OR spatch
not found in \$PATH. Install package 'coccinelle'!"
    exit 1
 fi

Regards

-- 
T.J. Yang

--00000000000057eb6a05a173f4e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div>I tried to compile drbd9 =
master branch=C2=A0 on centos 8 which come with spatch 1.0.7 only.</div><di=
v><br></div><div>following is one-liner patch to make error message match t=
he checks(if hash spatch &amp;&amp; spatch_is_recent; then)=C2=A0 in=C2=A0d=
rbd-kernel-compat/gen_compat_patch.sh</div><div><br></div>diff --git a/drbd=
/drbd-kernel-compat/gen_compat_patch.sh b/drbd/drbd-kernel-compat/gen_compa=
t_patch.sh<br>index 19466081..d6f34286 100644<br>--- a/drbd/drbd-kernel-com=
pat/gen_compat_patch.sh<br>+++ b/drbd/drbd-kernel-compat/gen_compat_patch.s=
h<br>@@ -105,6 +105,6 @@ elif test ! -e ../.git &amp;&amp; [[ $SPAAS =3D tr=
ue ]]; then<br>=C2=A0 =C2=A0 =C2=A0echo &quot; =C2=A0You can create a new .=
tgz including this pre-computed compat patch&quot;<br>=C2=A0 =C2=A0 =C2=A0e=
cho &quot; =C2=A0by calling \&quot;echo drbd-$REL_VERSION/drbd/$compat_patc=
h &gt;&gt;.filelist ; make tgz\&quot;&quot;<br>=C2=A0else<br>- =C2=A0 echo =
&quot;ERROR: spatch not found in \$PATH. Install package &#39;coccinelle&#3=
9;!&quot;<br>+ =C2=A0 echo &quot;ERROR: spatch is older than version $MIN_S=
PATCH_VERSION OR spatch not found in \$PATH. Install package &#39;coccinell=
e&#39;!&quot;<br>=C2=A0 =C2=A0 exit 1<br>=C2=A0fi<br><div><br></div><div>Re=
gards</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature">T.J. Yang</div></div>

--00000000000057eb6a05a173f4e1--

--===============6674449373529712079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============6674449373529712079==--
