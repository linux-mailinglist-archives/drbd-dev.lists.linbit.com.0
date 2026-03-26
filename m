Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNstJB9CxWkU8wQAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Mar 2026 15:26:39 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 499D7336BF4
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Mar 2026 15:26:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 525DB1630DF;
	Thu, 26 Mar 2026 15:26:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8589B1630C1
	for <drbd-dev@lists.linbit.com>; Thu, 26 Mar 2026 15:26:17 +0100 (CET)
Received: by mail-wr1-f51.google.com with SMTP id
	ffacd0b85a97d-43b9144790dso578457f8f.1
	for <drbd-dev@lists.linbit.com>; Thu, 26 Mar 2026 07:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774535177;
	x=1775139977; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=D2Q2L6QPYD77pFkuLTamPUn8SCwVh3rf5WS9Lfg0NYM=;
	b=oedslN1DmFeLWOZ6Hxj/bpEV4cgQoqjtIe6Q5TPC7MyfHIZn/e8KKRlHPh6fKoWvNw
	5+YMoZ30cIMv4eR6uoD62SF6TWyf6B7Uk02rF77B6+pa0NLHzHfeuifgJo4tH0V1x5LT
	JxVwUkqtyx4xvfmRkVCInDz8O5oFEQ4UaKdvTXfxIBkTo8itpI6+EOM8q8lhtDJTAZ+D
	fwDFD/ZYYUFlsYvio3mlx5qWZWcj0cbQbjp6J944IJfMpKDTe7y5uwvduHI19JJAV+yB
	EENBA1JKQlQajU6MG2NVM0m2305NbT6o0cOYVe4XGcl4SPArVjVuTa6XlrKmuQV5HqpW
	SIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774535177; x=1775139977;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=D2Q2L6QPYD77pFkuLTamPUn8SCwVh3rf5WS9Lfg0NYM=;
	b=BzGjFHJ0etB/Q9cVIBYcGON4g6qm9ovAej794zJIEM224dMCRp6ZEDnXdYMPD/5SMg
	9AAfnVIz0xowb6yTnVNIbKGAk36O4D+fmbna6AUW1v1xjrnH+862ezkV3ZVGm9CjNqCv
	ZTbEhzz4YOJNFEuY1iNc2WDhuerjvDTt9723kjnctRctjjKDvYyTEb0DoPqXhcXk33GI
	FLtpN41rVFkSgzAIajLiv425ZZZ277I53WDeINlzCx3/YNzrLVzYj429GBHrx+s1vPQx
	5yGDilW7mtn4+ntiQaLW/Dp7v+P1DHk/Qoir/P+nZEEqinILfGPt+ISID32zq6eulhwt
	5Fzw==
X-Gm-Message-State: AOJu0Yx6LSUbOpvRfTnsPgmLfYhhN8T2oW3ow8OHeawKNryk+uKRuoQ1
	aF3jvXQEDth8/aooVo/kwGdKTthC9ESKaCeiuxOoaVsRsqg+0X0g17MEjckURLKeETEmrQ==
X-Gm-Gg: ATEYQzydlt0P9giXjDrVL8z5e8AOC2CYdcPe2gSAmulaxuTUG9IcPc/bG2Z/XR86Utu
	SgmoSprpjtDN8C7PtqeCmYenZSxmwMuOO5lSaDp3MItxRSPOIcH94Zd23foGtEKEOLNs9+/RsPq
	3YAcPIl3BjTlVAAAN/YZoTu7V1emU4vTFZkAQRpt0YiYNe1rlG5VqLdV65oNMpElftMTd+q/8UV
	KSjS78kBXpynoUzC17x4qNeKve9+t0r6T+1oyVryirAk+etp9fiw+N7HCzDWVAEPwQgbyyJ5cMl
	/F6F7RHCUeAtU2iXM570YeAfbXQZmhPGcb/YPT5XycZOR7PlOJeZqUQjz34wFtUugMB/YmaFUE9
	85UHX3imzLZfuRio5kjdvhkHqkrF/uUwdV/VtSPLxW7xZEaR2DnWqGecRinNOHp77Ie2y8j5fJk
	G0TqbulTvCwGx4ks0ne+1mtXz/rVHnsVxpqpKSRIiAAXC7Z9gIb6+28efQJlK4q2aFUWyW1Kpmm
	mVdYiBVpTT4OzB+5wE=
X-Received: by 2002:a5d:5f83:0:b0:43b:4273:a6d2 with SMTP id
	ffacd0b85a97d-43b889af3f6mr11954568f8f.13.1774535176699; 
	Thu, 26 Mar 2026 07:26:16 -0700 (PDT)
Received: from [10.43.5.171] (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43b919df85csm11907248f8f.28.2026.03.26.07.26.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 26 Mar 2026 07:26:16 -0700 (PDT)
Message-ID: <af0dab46-3a73-4756-bea6-7cef66bb8d5e@linbit.com>
Date: Thu, 26 Mar 2026 15:26:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drbd: Add check for error pointer
To: Ethan Tidmore <ethantidmore06@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <20260317232318.18923-1-ethantidmore06@gmail.com>
	<20260317232318.18923-5-ethantidmore06@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260317232318.18923-5-ethantidmore06@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	NEURAL_SPAM(0.00)[0.924];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linbit.com,kernel.dk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 499D7336BF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 00:23, Ethan Tidmore wrote:
> The function find_cfg_context_attr() can return an error pointer or NULL
> in its error path.
> 
> Change NULL check to IS_ERR_OR_NULL().
> 
> Detected by Smatch:
> drivers/block/drbd/drbd_nl.c:6571 drbd_adm_dump_paths() error:
> 'resource_filter' dereferencing possible ERR_PTR()
> 
> Fixes: 626c95b0e2a23 ("drbd: rework netlink interface for DRBD 9 multi-peer config")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
>   drivers/block/drbd/drbd_nl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index c5e253820ccf..1f458eb972e9 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -6566,7 +6566,7 @@ static int drbd_adm_dump_paths(struct sk_buff *skb, struct netlink_callback *cb)
>   	resource = (struct drbd_resource *)cb->args[0];
>   	if (!cb->args[0]) {
>   		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
> -		if (resource_filter) {
> +		if (!IS_ERR_OR_NULL(resource_filter)) {
>   			retcode = ERR_RES_NOT_KNOWN;
>   			resource = drbd_find_resource(nla_data(resource_filter));
>   			if (!resource)

find_cfg_context_attr is also called identically in 3 other cases, so 
these have the same issue.
I've also fixed these 3 cases in my squash.

Regards,
Christoph
