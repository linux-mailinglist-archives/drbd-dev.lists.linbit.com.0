Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C13551D68
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jun 2022 15:58:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD60B4203A9;
	Mon, 20 Jun 2022 15:58:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C3D9420316
	for <drbd-dev@lists.linbit.com>; Mon, 20 Jun 2022 15:58:00 +0200 (CEST)
Received: by mail-ej1-f52.google.com with SMTP id kq6so21259924ejb.11
	for <drbd-dev@lists.linbit.com>; Mon, 20 Jun 2022 06:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pEXtbyozhMkuli9nPDKefAT5WBHGb96n63lR5pTJ66k=;
	b=ck+s8jY1D7ltgxzOo4g8F7/8y6cuqV28fhJvxu60vnuUSJk+JC8kOvF248RNb09BDa
	20X4Urdj957Q8Sv7gbStMOEpH70+fKWEcZEeDXxEHLobJXWMB9gnBoL/2VMCxBmigzcv
	SyIPojwsgCc2ew5GHgUeq5Z2vkD/X2lhcxahhcrY8vdPh81MletHu2eOzJCIXxKM/wHx
	iGoim1jLMario9q+O6M8KF1kkElS3FumbY7/0/Vk0sW3fdG5JBtPItjzURtRU4rQNdGP
	vPBYrmxHMv5OiAFDcV81BLmgpAU0i1XpwuN14+3JQQlwIB0yrUV0t/Les1ZQoF3oOy23
	dQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pEXtbyozhMkuli9nPDKefAT5WBHGb96n63lR5pTJ66k=;
	b=lW+aPFKN8+nOLoS5W0xQakmAFYcPXRjuur/KrjBMOtfJYV2ya4t1CxveUC9Ourh8Kj
	dn82lBiea5cmCtIxZL+l5C5cBICNj0mgqeBGRJ9cLoqzq/Ikp0RfpLgGETwsn8hYrMRI
	uD3x31zfgrIP9HEYZ9Wn0/6B6Pz5bAT7P/5ipYWaKxWrQ9qhpuFUWiEFD8X/fcxtgQrD
	rZJ3NhPLBS9I6EnTv8VxTc9NTOeOc55wxB9FfOomd9aIpRDtJQVSxZlJ32oBJafP2PVu
	pAPIzLam4Ti3wI3lp6J68/OOxdnlbJjzGXHX8aJ0AKodW0DCQdsFQ16WZmt/SfIRnE3A
	PhPw==
X-Gm-Message-State: AJIora975ThTkD1KHxQXwWxoqrkNVG+6BfUprCvX0paJN5kISgOgK/sB
	mRKJvZUMkBgvuqXXde/FaTB6nUIgSWcf2oVenQTxBWcKgXofGTE7
X-Google-Smtp-Source: AGRyM1uAZ7XNxknklftA6m/duBrc8d63yU00b0AJviu5oY3kwwkcCmCe7Qin0RDGNCLNhoBZCfX3pUqiwa3JGOL3vSg=
X-Received: by 2002:a17:906:99ca:b0:711:bdca:b85a with SMTP id
	s10-20020a17090699ca00b00711bdcab85amr21456871ejn.224.1655733479778;
	Mon, 20 Jun 2022 06:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220615140620.31630-1-kvapss@gmail.com>
	<CAGNP_+VHaMWzb-Z4ujuasuVDoLE459JAQ6q88JDLGeKJwKfmjw@mail.gmail.com>
	<CAGO-sgM98Rugu-=KO1VOSGKOnPbFGXKe-YaaG50WyQ_0dL3JuQ@mail.gmail.com>
In-Reply-To: <CAGO-sgM98Rugu-=KO1VOSGKOnPbFGXKe-YaaG50WyQ_0dL3JuQ@mail.gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 20 Jun 2022 15:57:49 +0200
Message-ID: <CAGNP_+Vr2MrmzSJvyPJqpt9gGK+k7y=M=N1YYTjVZAOAQc9xDw@mail.gmail.com>
To: kvaps <kvapss@gmail.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] compat: make spaas url configurable
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

Applied as
https://github.com/LINBIT/drbd/commit/bd96720a720c02fbbf5368ced50aae85a6ec8ebe

Thanks!
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
