Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6718E5213A8
	for <lists+drbd-dev@lfdr.de>; Tue, 10 May 2022 13:25:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4964A420621;
	Tue, 10 May 2022 13:25:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B14B4202D2
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 13:25:40 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id l18so32239492ejc.7
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 04:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0wM0wFAxWqfHY0r/2qkKrUbDoFYjtknFuhiaW6AqbIg=;
	b=ZCtRmBBpMS0LHe4rz7WJBHn2g0Z1BXMJoO3JNaaNw3Tf4A0mteyCQ3nffwLSr2R01O
	xEytkZ2IlJANpMjmRy/P0+jp7C6LrAdEr83YQKrpk3TsifsTjUc86NfL/eK4ScEtxWxB
	taY6IEukJp5ei28nNt1Q16YnhRMn9LRuG3q+tKrBl8yEA7UBWhLPCVhVWAKBxMpcGb3M
	/HH1dfPS3lD3hw25dCIIHRAQegpmHRsBwKMUJGjWeLvOHi6olYyOcHGPZDJqcuqOy+Hc
	C723X0XqeRb6E1B4UlghYCOsAnCygFqlXGBCtJDjSYLPlFksotwvr02IGR+tLjz2NhMq
	zz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0wM0wFAxWqfHY0r/2qkKrUbDoFYjtknFuhiaW6AqbIg=;
	b=8CFud6BVdShDlntBcJiquSRaXJLz/itXzZWfzbReQpwYBFgy8W61jQ+ZG+XdTtzuMN
	ajrbPB9tJOFjcfcJjIZJGhS47s2b/qYfTwxXAkcWnzx0DrUzmRLvUMyreV024eeIVlVM
	Ozsw0wq9EwAfN6T6UvWc1Qx8VUA4A7vP4yXItra9d1Rvsp/2i/by91Mzv2nOs3yi0wti
	i5qS7UgfE24bT2pTixxtxbl9yxIsbmAOCVB+nw9QoLHeSOubVrOsqkQCjbEPHuNtCvCx
	Ju+EYcKSJ0kVBvTy+5VVlZ/42XEok3GB45+IT6DhsMgbEFv5OTVLAVh/QlSK2VqJrIpP
	JyzQ==
X-Gm-Message-State: AOAM533mWlIeR1cEA1s6qI7xwCWo2HWtESmENxYMwrX/Tlde24T1Dg6L
	g2hpAJLVbUz+B+HvDRwEXIdWlDNOU0VMFaAiwY/iiZJi
X-Google-Smtp-Source: ABdhPJxMnMJAPRbRidg4tlJEOwPMVYfmX4tvoOK8dXq6T2AeLY9iRwtZeDAK0WOs41M3lnC3NBn154vq+bkFMjYsHO4=
X-Received: by 2002:a17:907:971b:b0:6f4:3b8c:ae04 with SMTP id
	jg27-20020a170907971b00b006f43b8cae04mr19316395ejc.548.1652181879751;
	Tue, 10 May 2022 04:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <AAsAIAC8IfSaXGMbJbgsMKpG.1.1652181400930.Hmail.rui.xu@easystack.cn>
In-Reply-To: <AAsAIAC8IfSaXGMbJbgsMKpG.1.1652181400930.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 10 May 2022 13:24:29 +0200
Message-ID: <CAGNP_+W2Ys27fco_W6x+UvkUMKva5FpzZEAu4EnhvqM+Bx5NGQ@mail.gmail.com>
To: "rui.xu" <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] drbd: a proposal of two-primaries mode
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

Could you describe your use case in more detail? What are you trying
to achieve with DRBD?

This will help understand why you would like to restore the
functionality. Perhaps there is a simpler solution that also works for
your purposes.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
