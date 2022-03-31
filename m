Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCD4EDADC
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Mar 2022 15:48:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44C684207B8;
	Thu, 31 Mar 2022 15:48:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67D8F4207B8
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:48:12 +0200 (CEST)
Received: by mail-pg1-f174.google.com with SMTP id o8so20014708pgf.9
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=WIjS4hHkncWnADQSguPcZ9yDRhMIIgfXbDG/5koXL+M=;
	b=8JdtJA3KoB9+DGVHgZEvfjxJgMQB8AJ3+FSa/hLLh59tuXtTzMTYqls626HhE0Xx60
	M8oCxHsUeiyFnCM6zqv7RaiC1o3cURHKKd8TiUDajJIKwDH91uIAhjAWsRucpfdjRjaL
	MNyNzgTZVBriuzx0dA4ay60uAVu43DYTvPKr2G0XVXQ8KissoueE1rxxZFNyFbs4ES5/
	j4bv8lJfqwpnH0vwKGlzFRvcN1mAMxs4MPKKIb6qB3gRrEdaWRmCGB31IUaoOfyPhuIW
	RShLIX/p6TZP2ZhVRV6PkG5Qw+d9y/FGgpiUFEywgccI3/V+ah8sVNYNy6QbTu0k9Ed1
	DeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=WIjS4hHkncWnADQSguPcZ9yDRhMIIgfXbDG/5koXL+M=;
	b=3FLi9vQlKqKVKLCS4ECQtutj6ecc3pZ4OgrVx3kcQrJ9xfUe3tiwChBd8gD3u2qKUK
	N1ckD5vPRZ/B6zrDO4F+ca7T9AuZzhvHmyrBAt3CClEHPObFTcsr77JyLPmw+T+C5lJJ
	1an1rHIQ9+4JG6C+w4QA5uN0de7aJ8xsWqqgmcutUwuYgs+sW79kiHeuRs4Nlq8KnuhH
	jA4d/pmB188Q3qcwOdBPZBNaNwzOqXBrhe2ADDWiBEZfR91/6JVK1hMOmBLwJg9rWr9Z
	bmv+MlLMYnrl6gb3cFXyYccgm/EidrZfFLqtEnade3+xRflb4BFxbN7K4N+zIQSsbmjm
	w59w==
X-Gm-Message-State: AOAM530t/TNC2Y1Cmw2L7LSPXAI5FMm4IsV05amn935dBpBC+nkqOGUO
	czde95mDFzP4aS2K3YBiLFtR/XjbEvhJ3O0U
X-Google-Smtp-Source: ABdhPJx1JWwl3z3vLqKxPFPwBAUbmruyet8e5XAqvGozXt0cKP0NQz5DfjALnTIZvovc9OIbpJ01HQ==
X-Received: by 2002:a05:6a02:283:b0:342:703e:1434 with SMTP id
	bk3-20020a056a02028300b00342703e1434mr10853784pgb.74.1648734492091;
	Thu, 31 Mar 2022 06:48:12 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	lw4-20020a17090b180400b001c7327d09c3sm10037155pjb.53.2022.03.31.06.48.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 31 Mar 2022 06:48:11 -0700 (PDT)
Message-ID: <8dbb5fc7-7170-d190-ba24-2ef13dc73623@kernel.dk>
Date: Thu, 31 Mar 2022 07:48:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220331134236.776524-1-christoph.boehmwalder@linbit.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] MAINTAINERS: add drbd co-maintainer
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gMy8zMS8yMiA3OjQyIEFNLCBDaHJpc3RvcGggQsO2aG13YWxkZXIgd3JvdGU6Cj4gSW4gbGln
aHQgb2YgdGhlIHJlY2VudCBjb250cm92ZXJzeSBzdXJyb3VuZGluZyB0aGUgKGxhY2sgb2YpCj4g
bWFpbnRlbmFuY2Ugb2YgdGhlIGluLXRyZWUgRFJCRCBkcml2ZXIsIHdlIGhhdmUgZGVjaWRlZCB0
byBhZGQgbXlzZWxmCj4gYXMgY28tbWFpbnRhaW5lci4gVGhpcyBhbGxvd3MgdXMgdG8gYmV0dGVy
IGRpc3RyaWJ1dGUgdGhlIHdvcmtsb2FkIGFuZAo+IHJlZHVjZSB0aGUgY2hhbmNlIG9mIHBhdGNo
ZXMgZ2V0dGluZyBsb3N0Lgo+IAo+IEkgd2lsbCBiZSBrZWVwaW5nIGFuIGV5ZSBvbiB0aGUgbWFp
bGluZyBsaXN0IGluIG9yZGVyIHRvIGVuc3VyZSB0aGF0IGFsbAo+IHBhdGNoZXMgZ2V0IHRoZSBh
dHRlbnRpb24gdGhleSBuZWVkLgoKQ2FuIHlvdSBnbyBvdmVyIHRoZSBvbmVzIEkgYWxyZWFkeSBs
aXN0ZWQ/IFRoYXQnZCBiZSBhIGdvb2Qgc3RhcnQuCgotLSAKSmVucyBBeGJvZQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBs
aXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
