Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E5D4FBFD3
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Apr 2022 17:07:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6D554202F4;
	Mon, 11 Apr 2022 17:07:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CA994201D4
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 17:07:01 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id u15so12870439ejf.11
	for <drbd-dev@lists.linbit.com>; Mon, 11 Apr 2022 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Hqnt4B5It88HYqQXt0vUYN5ael+zpZ4w7pbeC+8ukc=;
	b=ZjMJzXR7+6MhTEfLE9sstJEMKOZP+gMDGLCth8eo10wUeeZFEw7LJyA1WEoiUCM0WZ
	NRGujFEi0z2j2JWQ/Rni/8x4NhN6iUWomFd7Ed82sjw4enYIt3cE9Lqp1vzua+PBJTt6
	u1QsQX4MbLbl/lu8SzF0tRsOnfFgeJlKsESUeo6QvtcnG0QS/klMzIBRcSEr+RXI7f3N
	/YD4oloMCXSTEvcswsf/kYsye9+eLBO2Kg6j+xX5mjICaZiQNtEMzaNGFfKMttbdI/kI
	RqAj2Ihh0i2h4b5gw9yTozvqAX53xb1grTl2/PiyV4yYIG5i2Es+7zDCr96pe+KNafmP
	0GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Hqnt4B5It88HYqQXt0vUYN5ael+zpZ4w7pbeC+8ukc=;
	b=JH8atwExLicnoGvH+L3HN0h2eIGdplpjC/DpI0hUwEiwn/DWYgthhoLsw4jLRNJNqy
	nqHW5vHipfoGnhfxr46TciqzEFfqsqagImjX/dDqLRGQ37Y8WkqWV4h4gy91Z2fpwwiF
	vNdQ+Ac1qvdq+L5a8asXbuxILU2MlYzvRGlUYRiftkszhT83ghTJ7TOTQTBE+5phIPSe
	hBeV104/8iOu0u0TPVr4oWJPsFluCKjbALjoFrpNcfDygflaDiw/BY3AmXMejAIpbnR6
	0tSpv4cY7BMoVk8L8cof4jLNcY11CP1NyNZCUbzNBAVuI+PeVV0n1C7uokg1y57+lM5R
	J48g==
X-Gm-Message-State: AOAM532puffYMdJs6xG2C67jZllXT2FbvSsJ7hajhiWWP6GEvN+FhNKI
	JqXtUbWPDNoCuURazpTDfpwG6JZK5hbGDhf9pEjE6gb7izrd7Q==
X-Google-Smtp-Source: ABdhPJzvq0Wtlo/v0vkMYid5t0unugpIejIh9EEXaymmugYkJkiVwfiduWv9MorMId8ZAB0k6NqsarKuCDhANz1RVgg=
X-Received: by 2002:a17:906:d108:b0:6e8:7765:a70b with SMTP id
	b8-20020a170906d10800b006e87765a70bmr8801611ejz.436.1649689620248;
	Mon, 11 Apr 2022 08:07:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGNP_+VZLZhCuMymZO+qwSDZmFjYgyJHLfsPLwGZaGE+E5cD_Q@mail.gmail.com>
	<ALwAwgD0IQVS18p0UFmrbKrn.3.1649679152288.Hmail.rui.xu@easystack.cn>
In-Reply-To: <ALwAwgD0IQVS18p0UFmrbKrn.3.1649679152288.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 11 Apr 2022 17:06:49 +0200
Message-ID: <CAGNP_+U6QZGQmRyWZPtX7CvoQoACFNtBYFSuV2sN0odQRZtQwA@mail.gmail.com>
To: Xu Rui <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: create new uuid even we dont have
	quorum
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Xu,

> By the way, have you focused on DRBD9.1 and is there a stable verison of it?

We have stopped working on 9.0. The final release was 9.0.32 (see the
release announcement). For now, we are continuing to apply fixes to
allow it to be built for newer kernels, but otherwise the 9.0 branch
is end-of-life.

DRBD 9.1 is as stable as 9.0 was. The most recent release is 9.1.6.

Since 9.1.6, the 9.1 branch has received significant work in the area
of handling suspended IO due to quorum loss. It looks like this might
be relevant for you. There will be a 9.1.7 release soon containing
these fixes.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
