Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHw+FxQkl2mZvAIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:54:12 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id F0B1215FD06
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:54:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4294162EF2;
	Thu, 19 Feb 2026 15:53:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EED46160922
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 15:53:55 +0100 (CET)
Received: by mail-wr1-f44.google.com with SMTP id
	ffacd0b85a97d-43626796202so988254f8f.3
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 06:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1771512835;
	x=1772117635; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=/BPu7oUCo+mkYs6t9WVIVRIlfLwpsIPMLJ2jvnF+txg=;
	b=lKUBOZJZp9jyHn8ohwJ7tWGp1l3PkICi2x56ggn0Hf6DdawtcWG0YXo0rvqbN/vkyM
	XYWna5FJ90i9REhk4S9+ZsQjeRB5H0aGmnaSHHXMM1jdSYixGxHl3fXOIaAa16P0OZYV
	lM+qfBHtCcbluOTbAgZgtWJKJbEZ94zxVnrMV+TCigMMsKFy68Q92WIWzNrYtS4IbdCv
	5LRJrdzw9WUuArBBSPoXUbyxFJGJMr3G35SyNbn5GAEvxv8xQQORFHmoS54p3C6U4x0+
	UMdfUxHcVnzjieDTe5mhHjMJlqcerrtUjyjDBEwaB81qZJZoOY+MixoiHJ47fDaSqmZ0
	yT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771512835; x=1772117635;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=/BPu7oUCo+mkYs6t9WVIVRIlfLwpsIPMLJ2jvnF+txg=;
	b=T+WHeZqYkeFEPsY9rhhwY3J4gsa50poUlB+2w2xgo4XbB18oLYl1WgMhohwALcs5LG
	mh3q3ExPug1MMSVwxPFxq2NB6DiymmazKCOxvjR01nf8iOYFFm7c/mZDVuUepkuyM3jr
	xhhHNVWt0njtfXvR+XlSJ8JRKRssiVvphTa3C54xBsn+aXcdLpobyCN72EacmndKq9Aq
	r2H/6grOw7t3oz3R+hXalp5blKJ35yTWe0h3NDJp1DfQrBoMIj6AmUUR2jwjEZNjyTec
	h5ZeOTdrxZcK3bD3dkLbLNKO6idv9eDLYWKp4dIZUh2oQ444CL+JtUwatddPzDA9wXzV
	XCsQ==
X-Gm-Message-State: AOJu0Yz1C99UM8mfX5kZGXzSUSGEAQrxBry6oapmKy3Qp3TnRnXRcCGb
	8iT5GbzA07qtDx8q1iH9+L2fjZHibNGB6GW9IpDCm5/A+ukkNFFxgpGcrgVutd4NqDloIA==
X-Gm-Gg: AZuq6aImEGOAXJjZmdWZUdBdImQ3Osw1dWBsDKM1SSFehOgIuypPHUR4LXlPf9R7JO+
	wldJ34NoJ+wL+JbtXkBTHWsEkxjGyHQub4sfzVTxJEz3vlfe1YSF6J80iv4LvsNcv+3AObyRyyk
	DNLyg2LvNqAwJ1WYdl8Aim5YN3zCSAD2FCOdGMVoE0ehNW3dTgPUHFTAt0MhaPYGKWYSguIn7rt
	FFm4Rg8hr9pE9xOuY9obgWkraD5IFGmTcxQNx0nKbv0ZLr+syDFX0coKDJzdp6Lt9rxWELLXicU
	DSRdCZ7yEUcGOze3Zbe7cTrNIPCpiwtee/I8++ZthKUnT/+ab2Tlv24zhFtEo564cTpioV1xBqa
	hEMHBeaASly6YYzKOn3lSqlq7QDd69RNc9iIoVjpxCrWCK+X4WkoCDZaXAApFGHaLi2rTLitwAe
	J+OUkOUasfL0EZ7UePeAnQZS5GlpaULCWPthB2SBt6Ujj+YR22hinccA3T+XiLtJsBhfStGjvQd
	y5YZVBNz9dbSSOJVww=
X-Received: by 2002:a5d:50ce:0:b0:437:8fc0:8802 with SMTP id
	ffacd0b85a97d-43958e527f8mr8129399f8f.48.1771512835126; 
	Thu, 19 Feb 2026 06:53:55 -0800 (PST)
Received: from [10.43.5.171] (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43796acf5b9sm49037171f8f.34.2026.02.19.06.53.54
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Feb 2026 06:53:54 -0800 (PST)
Message-ID: <2b87cbab-49e2-4290-8784-b771e90e016f@linbit.com>
Date: Thu, 19 Feb 2026 15:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: fix a null-pointer dereference when the request
	event in drbd_request_endio() is READ_COMPLETED_WITH_ERROR
To: Tuo Li <islituo@gmail.com>, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, axboe@kernel.dk
References: <20260104165355.151864-1-islituo@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260104165355.151864-1-islituo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.870];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:islituo@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linbit.com,kernel.dk];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
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
X-Rspamd-Queue-Id: F0B1215FD06
X-Rspamd-Action: no action

On 1/4/26 17:53, Tuo Li wrote:
> In drbd_request_endio(), the request event what can be set to
> READ_COMPLETED_WITH_ERROR. In this case, __req_mod() is invoked with a NULL
> peer_device:
> 
>    __req_mod(req, what, NULL, &m);
> 
> When handling READ_COMPLETED_WITH_ERROR, __req_mod() unconditionally calls
> drbd_set_out_of_sync():
> 
>    case READ_COMPLETED_WITH_ERROR:
>      drbd_set_out_of_sync(peer_device, req->i.sector, req->i.size);
> 
> The drbd_set_out_of_sync() macro expands to __drbd_change_sync():
> 
>    #define drbd_set_out_of_sync(peer_device, sector, size) \
> 	__drbd_change_sync(peer_device, sector, size, SET_OUT_OF_SYNC)
> 
> However, __drbd_change_sync() assumes a valid peer_device and immediately
> dereferences it:
> 
>    struct drbd_device *device = peer_device->device;
> 
> If peer_device is NULL, this results in a NULL-pointer dereference.
> 
> Fix this by adding a NULL check in __req_mod() before calling
> drbd_set_out_of_sync().

Thank you for the report and patch.
The bug analysis is correct, but the fix is not.

> 
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>   drivers/block/drbd/drbd_req.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index d15826f6ee81..aa3da2733f14 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -621,7 +621,8 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
>   		break;
>   
>   	case READ_COMPLETED_WITH_ERROR:
> -		drbd_set_out_of_sync(peer_device, req->i.sector, req->i.size);
> +		if (peer_device)
> +			drbd_set_out_of_sync(peer_device, req->i.sector, req->i.size);
>   		drbd_report_io_error(device, req);
>   		__drbd_chk_io_error(device, DRBD_READ_ERROR);
>   		fallthrough;

In this code path, peer_device is *always* NULL -- the only caller that
sets READ_COMPLETED_WITH_ERROR is drbd_request_endio(), which always
passes NULL for peer_device. So this NULL check effectively turns the
drbd_set_out_of_sync() call into dead code.

Silently skipping the call here means we lose out-of-sync tracking
for local read errors, which is a data consistency problem.

The proper fix is to obtain the peer_device via 
first_peer_device(device), like in a similar path in drbd_req_destroy 
(drbd_req.c:125).

case READ_COMPLETED_WITH_ERROR:
	drbd_set_out_of_sync(first_peer_device(device),
			     req->i.sector, req->i.size);

Regards,
Christoph

--
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage
